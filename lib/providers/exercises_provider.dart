import 'package:flutter/material.dart';
import 'package:vital/services/local_exercises_service.dart';

class ExerciseProvider with ChangeNotifier {
  List<Map<String, dynamic>> _exercises = [];
  final LocalExerciseService _service = LocalExerciseService();

  List<Map<String, dynamic>> get exercises => _exercises;

  Future<void> loadExercises(String bodyPart) async {
    _exercises = [];
    notifyListeners();
    
    try {
      _exercises = await _service.getExercisesByBodyPart(bodyPart);
      notifyListeners();
    } catch (e) {
      print('Erro ao carregar exercícios: $e');
      _exercises = [];
      notifyListeners();
    }
  }
}