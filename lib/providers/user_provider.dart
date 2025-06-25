import 'package:flutter/material.dart';

class User {
  final String name;
  final String? email;
  final double? weight;
  final double? height;
  final String? profileImagePath;
  final String? trainingPreference; // Adicione esta propriedade

  User({
    required this.name, 
    this.email,
    this.weight, 
    this.height,
    this.profileImagePath,
    this.trainingPreference, // Adicione este parâmetro
  });

  User copyWith({
    String? name,
    String? email,
    double? weight,
    double? height,
    String? profileImagePath,
    String? trainingPreference, // Adicione este parâmetro
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      trainingPreference: trainingPreference ?? this.trainingPreference, // Adicione esta linha
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
  
  Future<void> updateUserProfile({
    String? name,
    String? email,
    double? weight,
    double? height,
    String? profileImagePath,
    String? trainingPreference, // Adicione este parâmetro
  }) async {
    if (_user == null) {
      return;
    }
    
    final updatedUser = User(
      name: name ?? _user!.name,
      email: email ?? _user!.email,
      weight: weight ?? _user!.weight,
      height: height ?? _user!.height,
      profileImagePath: profileImagePath ?? _user!.profileImagePath,
      trainingPreference: trainingPreference ?? _user!.trainingPreference, // Adicione esta linha
    );
    
    _user = updatedUser;
    
    notifyListeners();
  }
}