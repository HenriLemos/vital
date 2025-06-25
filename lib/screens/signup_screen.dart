import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vital/providers/user_provider.dart';
import 'package:vital/providers/user_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  bool _isLoading = false;
  bool _acceptedTerms = false;
  String? _emailError;

  // Função para validar email
  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    return emailRegExp.hasMatch(email);
  }

  // Função para exibir mensagens
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  // Função de cadastro com SQLite
  Future<void> _handleSignup() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    
    if (!_isValidEmail(email)) {
      _showMessage('Por favor, insira um e-mail válido.');
      return;
    }
    
    // Converter peso e altura para double
    double? weight;
    double? height;
    
    if (_weightController.text.isNotEmpty) {
      try {
        weight = double.parse(_weightController.text.replaceAll(',', '.'));
      } catch (e) {
        _showMessage('Formato de peso inválido. Use apenas números.');
        return;
      }
    }
    
    if (_heightController.text.isNotEmpty) {
      try {
        height = double.parse(_heightController.text.replaceAll(',', '.'));
        // Se altura for em cm (maior que 3), converter para metros
        if (height > 3) {
          height = height / 100;
        }
      } catch (e) {
        _showMessage('Formato de altura inválido. Use apenas números.');
        return;
      }
    }

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage('Preencha todos os campos obrigatórios.');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final success = await registerUser(
        name, 
        email, 
        password, 
        weight: weight,
        height: height
      );

      if (success) {
        final userData = await loginUser(email, password);
        if (userData != null) {
          final user = User(
            name: userData['name'],
            email: userData['email'],
            weight: userData['weight'],
            height: userData['height'],
            profileImagePath: userData['profile_image_path'],
            trainingPreference: userData['training_preference'],
          );
          
          Provider.of<UserProvider>(context, listen: false).setUser(user);
          
          Navigator.of(context).pushNamed('/training-preference');
        }
      }else {
        _showMessage('Erro ao criar conta. Verifique se o e-mail já está cadastrado.');
      }
    } catch (e) {
      _showMessage('Erro inesperado. Tente novamente.');
    } finally {
      setState(() => _isLoading = false);
    }
  }

    void _showTermsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Termos de Uso'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Ao utilizar este aplicativo, você concorda que:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('• Suas informações de peso e altura serão utilizadas para calcular sua necessidade diária de água e outros indicadores de saúde.'),
              SizedBox(height: 5),
              Text('• Seus dados serão armazenados localmente no dispositivo e não serão compartilhados com terceiros.'),
              SizedBox(height: 5),
              Text('• Você poderá excluir suas informações a qualquer momento.'),
              SizedBox(height: 15),
              Text('Suas informações são utilizadas apenas para fornecer uma experiência personalizada e ajudá-lo a acompanhar seus objetivos de saúde.'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Cadastrar',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                // Campo: Nome
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Campo: E-mail
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        _emailError = null;
                      } else if (!_isValidEmail(value)) {
                        _emailError = 'Digite um e-mail válido';
                      } else {
                        _emailError = null;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: const OutlineInputBorder(),
                    errorText: _emailError,
                    suffixIcon: _emailController.text.isNotEmpty
                        ? Icon(
                            _isValidEmail(_emailController.text)
                                ? Icons.check_circle
                                : Icons.error,
                            color: _isValidEmail(_emailController.text)
                                ? Colors.green
                                : Colors.red,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 20),

                // Campo: Senha
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Campo: Peso
                TextField(
                  controller: _weightController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Peso (kg)',
                    hintText: 'Ex: 70.5',
                    border: OutlineInputBorder(),
                    suffixText: 'kg',
                  ),
                ),
                const SizedBox(height: 20),
                
                // Campo: Altura
                TextField(
                  controller: _heightController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Altura (m)',
                    hintText: 'Ex: 1.75 ou 175',
                    border: OutlineInputBorder(),
                    suffixText: 'm',
                  ),
                ),
                const SizedBox(height: 30),

                Row(
                  children: [
                    Checkbox(
                      value: _acceptedTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptedTerms = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _acceptedTerms = !_acceptedTerms;
                          });
                        },
                        child: Row(
                          children: [
                            const Text('Eu aceito os '),
                            GestureDetector(
                              onTap: _showTermsDialog,
                              child: const Text(
                                'Termos de Uso',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 30),

                // Botão de Cadastro
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleSignup,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Cadastrar'),
                ),
                const SizedBox(height: 10),

                // Link para a tela de login
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Já tem uma conta? Faça login!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}