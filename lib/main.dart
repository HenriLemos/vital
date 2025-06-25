import 'package:flutter/material.dart';
import 'package:vital/providers/bodypart_provider.dart';
import 'package:vital/providers/exercises_provider.dart';
import 'package:vital/providers/user_provider.dart';
import 'package:vital/screens/edit_perfil_screen.dart';
import 'package:vital/screens/home_screen.dart';
import 'package:vital/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:vital/screens/perfil_screen.dart';
import 'package:vital/screens/preferencia_treino_screen.dart';
import 'package:vital/screens/signup_screen.dart';
import 'package:vital/screens/treinos_screen.dart';
import 'package:vital/screens/consumo_agua_screen.dart';
import 'package:vital/screens/welcome_screen.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:vital/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }

  await NotificationService.initialize();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => BodyPartProvider()),
        ChangeNotifierProvider(create: (_) => ExerciseProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          
          // Customização dos campos de texto
          inputDecorationTheme: InputDecorationTheme(
            // Cor do texto, cursor e seleção
            labelStyle: TextStyle(color: Colors.black87),
            hintStyle: TextStyle(color: Colors.black54),
            
            // Cores das bordas
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black54, width: 1.0),
            ),
            
            // Cor do preenchimento quando focado
            focusColor: Colors.black,
          ),
          
          // Personalização global dos TextFields
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.black,
            selectionColor: Colors.orange.withOpacity(0.3),
            selectionHandleColor: Colors.orange,
          ),
          
          // Outras personalizações existentes
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
            ),
          ),
        ),
        initialRoute: '/welcome',
        routes: {
          '/welcome': (context) => const WelcomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/home': (context) => const HomeScreen(),
          '/perfil': (context) => const ProfileDetailsScreen(),
          '/treinos': (context) => const TreinosScreen(),
          '/water': (context) => const WaterScreen(),
          '/editar-perfil': (context) => const EditProfileScreen(),
          '/training-preference': (context) => const TrainingPreferenceScreen(),
        },
        builder: (context, child) {
          return WillPopScope(
            onWillPop: () async {
              // Check if we can pop the current route
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
                return false; // Don't exit the app
              } else {
                // If we're at the root (welcome screen), show a confirmation dialog
                if (ModalRoute.of(context)?.settings.name == '/welcome') {
                  return await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Sair do App'),
                      content: const Text('Tem certeza que deseja sair do app?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Sair'),
                        ),
                      ],
                    ),
                  ) ?? false;
                }
                return true; // Allow exit
              }
            },
            child: child!,
          );
        },
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/treinos');
        break;
      case 2:
        Navigator.pushNamed(context, '/water');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home), 
          label: 'Home'
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.description), 
          label: 'Treinos'
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.water_drop,
            color: _selectedIndex == 2 ? Colors.orange : Colors.blue,
          ),
          label: 'Consumo de Água'
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}