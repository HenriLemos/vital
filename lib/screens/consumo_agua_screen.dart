import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vital/main.dart';
import 'package:vital/services/agua_notificacao_service.dart';
import '../providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:confetti/confetti.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({Key? key}) : super(key: key);

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> with SingleTickerProviderStateMixin {
  double? _waterAmount;
  double _consumedWater = 0;
  String _lastResetDate = '';
  final TextEditingController _waterInputController = TextEditingController();
  bool _notificationsEnabled = false;
  int _notificationInterval = 120;
  bool _goalCompletedToday = false;
  
  late AnimationController _animationController;
  Animation<double> _progressAnimation = const AlwaysStoppedAnimation(0);
  double _previousProgress = 0.0;
  late ConfettiController _confettiController;
  
  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    
    _confettiController = ConfettiController(duration: const Duration(seconds: 2));
    
    _progressAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadConsumedWater();
      _calculateWaterIntake();
      _checkDateReset();
      _loadNotificationPreferences();
    });
  }
  
  @override
  void dispose() {
    _waterInputController.dispose();
    _animationController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  Future<void> _loadNotificationPreferences() async {
    final enabled = await WaterNotificationService.areNotificationsEnabled();
    final interval = await WaterNotificationService.getNotificationInterval();

    setState(() {
      _notificationsEnabled = enabled;
      _notificationInterval = interval;
    });

    if (_waterAmount != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('targetWaterAmount', _waterAmount!);
    }

    if (_notificationsEnabled) {
      WaterNotificationService.scheduleWaterReminders();
    }
  }

  Future<void> _toggleNotifications(bool value) async {
    await WaterNotificationService.setNotificationsEnabled(value);
    setState(() {
      _notificationsEnabled = value;
    });
  }

  Future<void> _changeNotificationInterval(int minutes) async {
    await WaterNotificationService.setNotificationInterval(minutes);
    setState(() {
      _notificationInterval = minutes;
    });
  }
  
  Future<void> _loadConsumedWater() async {
    final prefs = await SharedPreferences.getInstance();
    final consumed = prefs.getDouble('consumedWater') ?? 0;
    final goalCompleted = prefs.getBool('goalCompletedToday') ?? false;
    
    setState(() {
      _consumedWater = consumed;
      _lastResetDate = prefs.getString('lastResetDate') ?? '';
      _goalCompletedToday = goalCompleted;
    });
    
    _updateProgressAnimation();
  }

  Future<void> _saveConsumedWater() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('consumedWater', _consumedWater);
    await prefs.setString('lastResetDate', _lastResetDate);
    await prefs.setBool('goalCompletedToday', _goalCompletedToday);
  }

  void _checkDateReset() {
    final today = DateTime.now().toIso8601String().split('T')[0];
    if (_lastResetDate != today) {
      setState(() {
        _consumedWater = 0;
        _lastResetDate = today;
        _goalCompletedToday = false;
      });
      _saveConsumedWater();
      _updateProgressAnimation();
    }
  }

  void _addWaterConsumption(double amount) {
    _previousProgress = _progressPercentage;
    
    setState(() {
      _consumedWater += amount;
    });
    _saveConsumedWater();
    
    _updateProgressAnimation();

    // Check if goal was completed
    if (_waterAmount != null && !_goalCompletedToday) {
      if (_consumedWater >= _waterAmount!) {
        setState(() {
          _goalCompletedToday = true;
        });
        _saveConsumedWater();
        _showGoalCompletionDialog();
        _confettiController.play();
      }
    }

    if (_waterAmount != null) {
      final remaining = _waterAmount! - _consumedWater;
      if (remaining <= 500 && remaining > 0) {
        WaterNotificationService.sendImmediateWaterReminder(remaining);
      }
    }
  }
  
  void _resetWaterConsumption() {
    _previousProgress = _progressPercentage;
    
    setState(() {
      _consumedWater = 0;
      _goalCompletedToday = false;
    });
    _saveConsumedWater();
    
    _updateProgressAnimation();
  }
  
  void _updateProgressAnimation() {
    if (!mounted) return;

    final newProgress = _progressPercentage;
    
    _progressAnimation = Tween<double>(
      begin: _previousProgress,
      end: newProgress,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    
    _animationController.reset();
    _animationController.forward();
    
    _previousProgress = newProgress;
  }
  
  void _calculateWaterIntake() {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    
    if (user?.weight != null) {
      setState(() {
        _waterAmount = user!.weight! * 35;
      });
      
      _updateProgressAnimation();
    }
  }

  void _showAddWaterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Adicionar consumo de água'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _waterInputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade (ml)',
                hintText: 'Ex: 250',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Máximo: 5.000 ml (5 litros) por vez',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _quickAddButton(100),
                _quickAddButton(200),
                _quickAddButton(300),
                _quickAddButton(500),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCELAR'),
          ),
          ElevatedButton(
            onPressed: () {
              final input = _waterInputController.text;
              if (input.isNotEmpty) {
                final amount = double.tryParse(input);
                if (amount != null && amount > 0) {
                  if (amount > 5000) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Quantidade muito alta! Máximo permitido: 5.000 ml'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 3),
                      ),
                    );
                    return;
                  }
                  _addWaterConsumption(amount);
                }
              }
              _waterInputController.clear();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text('ADICIONAR'),
          ),
        ],
      ),
    );
  }

  Widget _quickAddButton(int amount) {
    return ElevatedButton(
      onPressed: () {
        _waterInputController.text = amount.toString();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade100,
        foregroundColor: Colors.blue.shade800,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        minimumSize: const Size(0, 36),
      ),
      child: Text('${amount}ml'),
    );
  }

  double get _remainingWater {
    if (_waterAmount == null) return 0;
    double remaining = _waterAmount! - _consumedWater;
    return remaining > 0 ? remaining : 0;
  }

  double get _progressPercentage {
    if (_waterAmount == null || _waterAmount == 0) return 0;
    double percentage = _consumedWater / _waterAmount!;
    return percentage > 1 ? 1 : percentage;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Hidratação Diária', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _resetWaterConsumption,
            tooltip: 'Resetar consumo de água',
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.orange, Colors.orange.shade300],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                child: Column(
                  children: [
                    const Text(
                      'Consumo Ideal de Água',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Baseado no seu peso de ${user?.weight?.toStringAsFixed(1) ?? "?"} kg',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 140,
                            height: 140,
                            child: AnimatedBuilder(
                              animation: _progressAnimation,
                              builder: (context, child) {
                                return CircularProgressIndicator(
                                  value: _progressAnimation.value,
                                  strokeWidth: 10,
                                  backgroundColor: Colors.blue.shade100,
                                  color: Colors.blue.shade500,
                                );
                              },
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.water_drop,
                              size: 70,
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      
                      const Text(
                        'Consumo registrado hoje',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            (_consumedWater / 1000).toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'litros',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      
                      Text(
                        user?.weight == null
                            ? 'Cadastre seu peso para calcular'
                            : 'Ainda falta beber',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      if (_waterAmount != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              (_remainingWater / 1000).toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'litros',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        )
                      else
                        const Text(
                          'Não disponível',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      const SizedBox(height: 10),
                      
                      Text(
                        _waterAmount != null
                            ? 'ou ${_remainingWater.toStringAsFixed(0)} ml para completar a meta'
                            : 'Adicione seu peso no perfil',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      ElevatedButton.icon(
                        onPressed: _showAddWaterDialog,
                        icon: const Icon(Icons.add),
                        label: const Text('Adicionar consumo'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 30),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
              colors: const [
                Colors.blue,
                Colors.cyan,
                Colors.lightBlue,
                Colors.indigo,
                Colors.teal
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
  
  Widget _buildTipItem({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
        ),
      ],
    );
  }

  void _showGoalCompletionDialog() {
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Meta de Água Atingida! 🎉', 
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Parabéns! Você atingiu sua meta diária de hidratação!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Icon(
                Icons.water_drop,
                size: 80,
                color: Colors.blue.shade700,
              ),
              const SizedBox(height: 10),
              Text(
                '${(_waterAmount! / 1000).toStringAsFixed(1)} litros consumidos',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Continuar'),
            ),
          ],
        ),
      );
    }
  }
}