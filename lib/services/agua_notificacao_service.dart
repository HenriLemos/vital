import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

class WaterNotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  static bool _initialized = false;
  
  // IDs para as notificações
  static const int waterReminderNotificationId = 100;
  
  // Chaves para SharedPreferences
  static const String notificationsEnabledKey = 'water_notifications_enabled';
  static const String notificationIntervalKey = 'water_notification_interval';
  
  // Inicializa o serviço
  static Future<void> initialize() async {
    if (_initialized) return;
    
    // Inicializar timezone
    tz_data.initializeTimeZones();
    
    // Configuração para Android
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    
    // Configuração para iOS
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    
    // Configuração geral
    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    
    // Inicializar notificações
    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Lidar com o toque na notificação - navegar para a tela de água
        // Isso seria implementado através de um sistema de navegação
      },
    );
    
    _initialized = true;
  }
  
  // Verifica se as notificações estão habilitadas
  static Future<bool> areNotificationsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(notificationsEnabledKey) ?? false;
  }
  
  // Habilitar/desabilitar notificações
  static Future<void> setNotificationsEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(notificationsEnabledKey, enabled);
    
    if (enabled) {
      await scheduleWaterReminders();
    } else {
      await cancelAllWaterReminders();
    }
  }
  
  // Obter intervalo de notificação (em minutos)
  static Future<int> getNotificationInterval() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(notificationIntervalKey) ?? 120; // 2 horas padrão
  }
  
  // Definir intervalo de notificação
  static Future<void> setNotificationInterval(int minutes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(notificationIntervalKey, minutes);
    
    // Reagendar notificações com o novo intervalo
    if (await areNotificationsEnabled()) {
      await cancelAllWaterReminders();
      await scheduleWaterReminders();
    }
  }
  
  // Agenda lembretes de água com base nas preferências
  static Future<void> scheduleWaterReminders() async {
    // Cancelar lembretes existentes
    await cancelAllWaterReminders();
    
    // Verificar se as notificações estão habilitadas
    if (!await areNotificationsEnabled()) return;
    
    // Obter intervalo configurado (em minutos)
    final intervalMinutes = await getNotificationInterval();
    
    // Agendar notificações para o dia inteiro em intervalos
    final now = tz.TZDateTime.now(tz.local);
    
    // Hora de início (8:00)
    var scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      8, // 8 da manhã
      0,
    );
    
    // Se a hora atual for depois das 8, ajustar para a próxima ocorrência
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(Duration(minutes: intervalMinutes));
    }
    
    // Hora final (22:00)
    final endTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      22, // 10 da noite
      0,
    );
    
    // Agendar notificações até o horário final
    int id = waterReminderNotificationId;
    
    while (scheduledTime.isBefore(endTime)) {
      await _scheduleWaterReminder(id, scheduledTime);
      scheduledTime = scheduledTime.add(Duration(minutes: intervalMinutes));
      id++;
    }
  }
  
  static Future<void> _scheduleWaterReminder(int id, tz.TZDateTime scheduledTime) async {
    final prefs = await SharedPreferences.getInstance();
    final consumedWater = prefs.getDouble('consumedWater') ?? 0;
    final targetWater = prefs.getDouble('targetWaterAmount') ?? 2000;
    
    final remainingWater = targetWater - consumedWater;
    final remainingWaterText = remainingWater > 0 
        ? '${remainingWater.toInt()} ml de água'
        : 'um pouco mais de água';
    
    await _notifications.zonedSchedule(
      id,
      'Hora de se hidratar!',
      'Você ainda precisa beber $remainingWaterText hoje.',
      scheduledTime,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'water_reminder_channel',
          'Lembretes de Hidratação',
          channelDescription: 'Lembretes para beber água regularmente',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
  
  static Future<void> cancelAllWaterReminders() async {
    for (int i = waterReminderNotificationId; i < waterReminderNotificationId + 50; i++) {
      await _notifications.cancel(i);
    }
  }
  
  static Future<void> sendImmediateWaterReminder(double remainingWater) async {
    await _notifications.show(
      999,
      'Lembrete de hidratação',
      'Você ainda precisa beber ${remainingWater.toInt()} ml de água hoje.',
      NotificationDetails(
        android: AndroidNotificationDetails(
          'water_reminder_channel',
          'Lembretes de Hidratação',
          channelDescription: 'Lembretes para beber água regularmente',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(),
      ),
    );
  }
}