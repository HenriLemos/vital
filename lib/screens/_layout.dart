// import 'package:flutter/material.dart';
// import 'package:vital/providers/bodypart_provider.dart';
// import 'package:vital/providers/user_provider.dart';
// import 'package:vital/screens/login.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => UserProvider()),
//         ChangeNotifierProvider(create: (_) => BodyPartProvider()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         initialRoute: '/login',
//         routes: {
//           '/login': (context) => const LoginScreen(),
//           // '/signup': (context) => const SignupScreen(),
//           // '/home': (context) => const MainTabNavigator(),
//           // '/perfil': (context) => const PerfilScreen(),
//           // '/execucoes': (context) => const ExecucoesScreen(),
//         },
//       ),
//     );
//   }
// }

// class BottomNavigationBarWidget extends StatelessWidget {
//   const BottomNavigationBarWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Treinos'),
//       ],
//       selectedItemColor: Colors.orange,
//       unselectedItemColor: Colors.grey,
//     );
//   }
// }