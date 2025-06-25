import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vital/providers/user_service.dart';
import '../providers/user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin(BuildContext context) async {
  final email = _emailController.text.trim();
  final password = _passwordController.text.trim();

  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Por favor, preencha todos os campos.')),
    );
    return;
  }

  final userData = await loginUser(email, password);

  if (userData != null) {
    double? weight;
    double? height;
    
    if (userData['weight'] != null) {
      weight = userData['weight'] is double 
          ? userData['weight'] 
          : double.tryParse(userData['weight'].toString());
    }
    
    if (userData['height'] != null) {
      height = userData['height'] is double 
          ? userData['height'] 
          : double.tryParse(userData['height'].toString());
    }

    final user = User(
      name: userData['name'],
      email: userData['email'],
      weight: weight,
      height: height,
      profileImagePath: userData['profile_image_path'],
      trainingPreference: userData['training_preference'],
    );
    
    Provider.of<UserProvider>(context, listen: false).setUser(user);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login realizado com sucesso!')),
    );

    if (user.trainingPreference == null) {
      Navigator.of(context).pushNamed('/training-preference');
    } else {
      Navigator.of(context).pushNamed('/home');
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Erro ao fazer login. Verifique suas credenciais.')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Rounded Logo
                ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),

                // Title
                const Text(
                  'VitalTech',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                // Email Input
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Input
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),

                // Login Button
                ElevatedButton(
                  onPressed: () => _handleLogin(context),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Comece seu treino'),
                ),
                const SizedBox(height: 10),

                // Navigation to Signup
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text('Não tem uma conta? Cadastre-se!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}