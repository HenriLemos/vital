import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Card do Perfil
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Avatar do Usuário
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.orange,
                            width: 4,
                          ),
                          image: user?.profileImagePath != null
                              ? DecorationImage(
                                  image: FileImage(File(user!.profileImagePath!)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: user?.profileImagePath == null
                            ? const Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: 80,
                              )
                            : null,
                      ),
                      const SizedBox(height: 20),
                      // Nome do Usuário
                      Text(
                        user?.name ?? 'Usuário',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Email do Usuário (placeholder)
                      Text(
                        user?.email ?? 'não encontrado',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Informações de Peso e Altura
                      const Divider(),
                      const SizedBox(height: 15),
                      
                      // Row para exibir peso e altura
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Informação de Peso
                          Column(
                            children: [
                              const Icon(
                                Icons.fitness_center,
                                color: Colors.orange,
                                size: 28,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Peso',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                user?.weight != null 
                                    ? '${user!.weight!.toStringAsFixed(1)} kg' 
                                    : 'Não informado',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          
                          // Separador vertical
                          Container(
                            height: 60,
                            width: 1,
                            color: Colors.grey[300],
                          ),
                          
                          // Informação de Altura
                          Column(
                            children: [
                              const Icon(
                                Icons.height,
                                color: Colors.orange,
                                size: 28,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Altura',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                user?.height != null 
                                    ? '${user!.height!.toStringAsFixed(2)} m' 
                                    : 'Não informado',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                      // Espaço adicional após as informações
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Informações adicionais ou botões (Card já existente)
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      _buildProfileOption(
                        icon: Icons.edit,
                        title: 'Editar Perfil',
                        onTap: () {
                          Navigator.pushNamed(context, '/editar-perfil');
                        },
                      ),
                      const Divider(),
                      _buildProfileOption(
                        icon: Icons.history,
                        title: 'Histórico de Treinos',
                        onTap: () {
                          // Implementar acesso ao histórico
                        },
                      ),
                      const Divider(),
                      _buildProfileOption(
                        icon: Icons.settings,
                        title: 'Configurações',
                        onTap: () {
                          // Implementar configurações
                        },
                      ),
                      const Divider(),
                      _buildProfileOption(
                        icon: Icons.logout,
                        title: 'Sair',
                        onTap: () {
                          Navigator.pushNamed(context, '/welcome');
                        },
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.orange),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}