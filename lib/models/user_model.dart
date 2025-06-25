import 'package:flutter/material.dart';

class User {
  final String name;
  final String? email;
  final double? weight;
  final double? height;
  final String? profileImagePath;
  final String? trainingPreference;

  User({
    required this.name,
    this.email,
    this.weight,
    this.height,
    this.profileImagePath,
    this.trainingPreference,
  });

  User copyWith({
    String? name,
    String? email,
    double? weight,
    double? height,
    String? profileImagePath,
    String? trainingPreference,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      trainingPreference: trainingPreference ?? this.trainingPreference,
    );
  }
}

class UserProvider with ChangeNotifier {
  User? _user;
  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
  
  // Método para atualizar o perfil do usuário
  Future<void> updateUserProfile({
    String? name,
    String? email,
    double? weight,
    double? height,
    String? profileImagePath,
  }) async {
    if (_user == null) {
      return;
    }
    
    final updatedUser = _user!.copyWith(
      name: name,
      email: email,
      weight: weight,
      height: height,
      profileImagePath: profileImagePath,
    );
    
    _user = updatedUser;
    
    notifyListeners();
  }
}