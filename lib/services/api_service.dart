import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://exercisedb.p.rapidapi.com';
  static const String apiKey = 'a4d00c3533mshda0fdcc6f951d8bp148cd7jsn0e02dcdfa708';

  static Future<List<dynamic>> fetchExercisesByBodyPart(String bodyPart) async {
    final Uri url = Uri.parse('$baseUrl/exercises/bodyPart/$bodyPart');

    try {
      final response = await http.get(
        url,
        headers: {
          'x-rapidapi-key': apiKey,
          'x-rapidapi-host': 'exercisedb.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erro ao carregar exercícios');
      }
    } catch (e) {
      print('Erro na API: $e');
      return [];
    }
  }
}