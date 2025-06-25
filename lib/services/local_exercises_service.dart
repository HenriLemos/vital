import 'package:vital/constants/constans.dart';

class LocalExerciseService {
  Future<List<Map<String, dynamic>>> getExercisesByBodyPart(String bodyPart) async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    String cleanBodyPart = _cleanBodyPartString(bodyPart);
    
    return demoExercises
        .where((exercise) => exercise['bodyPart'].toString().toLowerCase() == cleanBodyPart)
        .toList();
  }
  
  String _cleanBodyPartString(String bodyPart) {
    if (bodyPart.contains('{name:')) {
      final nameRegex = RegExp(r"name: ([^,}]+)");
      final match = nameRegex.firstMatch(bodyPart);
      if (match != null) {
        return match.group(1)!.trim().toLowerCase();
      }
    }
    return bodyPart.toLowerCase();
  }
}