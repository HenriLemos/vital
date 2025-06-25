import 'package:vital/services/database_service.dart';

final DatabaseService _dbService = DatabaseService();

// Login: Verifica o usuário no banco de dados
Future<Map<String, dynamic>?> loginUser(String email, String password) async {
  return await _dbService.getUser(email, password);
}

// Registro: Cria um novo usuário com peso, altura e imagem opcionais
Future<bool> registerUser(
    String name, 
    String email, 
    String password, 
    {double? weight, double? height, String? profileImagePath}
) async {
  try {
    await _dbService.insertUser(
      name, 
      email, 
      password, 
      weight: weight, 
      height: height,
      profileImagePath: profileImagePath
    );
    return true;
  } catch (e) {
    print('Erro ao registrar usuário: $e');
    return false; // Falha ao registrar
  }
}

// Atualizar perfil do usuário
Future<bool> updateUserProfile(
    String email,
    {String? name, double? weight, double? height, String? profileImagePath}
) async {
  try {
    await _dbService.updateUser(
      email, 
      name: name,
      weight: weight,
      height: height,
      profileImagePath: profileImagePath
    );
    return true;
  } catch (e) {
    print('Erro ao atualizar usuário: $e');
    return false;
  }
}