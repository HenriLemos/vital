import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vital/providers/user_provider.dart';
import 'package:vital/services/database_service.dart';

class TrainingPreferenceScreen extends StatefulWidget {
  const TrainingPreferenceScreen({Key? key}) : super(key: key);

  @override
  State<TrainingPreferenceScreen> createState() => _TrainingPreferenceScreenState();
}

class _TrainingPreferenceScreenState extends State<TrainingPreferenceScreen> {
  String? _selectedType;
  final DatabaseService _databaseService = DatabaseService();
  bool _isLoading = false;
  
  Future<void> _savePreference() async {
    if (_selectedType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione uma preferência de treino'))
      );
      return;
    }
    
    setState(() => _isLoading = true);
    
    try {
      // Obtém o usuário atual
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;
      
      if (user != null && user.email != null) {
        // Atualiza no banco de dados
        await _databaseService.updateUser(
          user.email!,
          trainingPreference: _selectedType,
        );
        
        // Atualiza o provider
        await userProvider.updateUserProfile(
          trainingPreference: _selectedType,
        );
        
        // Navega para a tela inicial
        if (mounted) {
          Navigator.of(context).pushNamed('/home');
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar preferência: $e'))
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _isLoading
              ? const Center(child: CircularProgressIndicator(color: Colors.orange))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'Personalize seu treino como quiser!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Escolha o tipo de treino que mais combina com você',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    
                    // Opção A
                    _buildTrainingOption(
                      title: 'Treino A - Parte Superior',
                      description: 'Foco em peito, costas, ombros e braços',
                      type: 'A',
                      icon: Icons.fitness_center,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Opção B
                    _buildTrainingOption(
                      title: 'Treino B - Parte Inferior',
                      description: 'Foco em pernas, glúteos e abdômen',
                      type: 'B',
                      icon: Icons.directions_run,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Opção C
                    _buildTrainingOption(
                      title: 'Treino C - Corpo Completo',
                      description: 'Treino completo para todo o corpo',
                      type: 'C',
                      icon: Icons.accessibility_new,
                    ),
                    
                    const Spacer(),
                    
                    // Botão confirmar
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _savePreference,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Continuar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
  
  Widget _buildTrainingOption({
    required String title,
    required String description,
    required String type,
    required IconData icon,
  }) {
    final isSelected = _selectedType == type;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedType = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          color: isSelected ? Colors.orange.withOpacity(0.1) : Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.orange : Colors.grey.shade200,
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
                size: 30,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isSelected ? Colors.orange : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Radio(
              value: type,
              groupValue: _selectedType,
              activeColor: Colors.orange,
              onChanged: (value) {
                setState(() {
                  _selectedType = value as String;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}