import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vital/providers/exercises_provider.dart';

class HomeScreen extends StatefulWidget {
  final String bodyPart;

  const HomeScreen({super.key, required this.bodyPart});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ExerciseProvider>(context, listen: false)
            .loadExercises(widget.bodyPart));
  }

  @override
  Widget build(BuildContext context) {
    final exercises = Provider.of<ExerciseProvider>(context).exercises;
    final String title = _formatTitle(widget.bodyPart);

    return Scaffold(
      appBar: AppBar(title: Text('Exercícios de $title')),
      body: exercises.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return GestureDetector(
                  onTap: () {
                    _showExerciseDetails(context, exercise);
                  },
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                            child: Container(
                              color: Colors.white,
                              child: Image.asset(
                                exercise['gifUrl'],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => 
                                    const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.white, // Fundo branco para a área do texto
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _capitalizeWords(exercise['name']),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  String _formatTitle(String bodyPart) {
    if (bodyPart.contains('{name:')) {
      final nameRegex = RegExp(r"name: ([^,}]+)");
      final match = nameRegex.firstMatch(bodyPart);
      if (match != null) {
        return _capitalizeWords(match.group(1)!.trim());
      }
    }
    return _capitalizeWords(bodyPart);
  }

  String _capitalizeWords(String text) {
    return text.split(' ').map((word) => 
      word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1)}' : ''
    ).join(' ');
  }

  void _showExerciseDetails(BuildContext context, Map<String, dynamic> exercise) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(16),
          child: ListView(
            controller: controller,
            children: [
              Text(
                _capitalizeWords(exercise['name']),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                height: 220,
                color: Colors.white, // Fundo branco para a área do gif de detalhe
                child: Image.asset(
                  exercise['gifUrl'],
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.broken_image, size: 80, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Grupo Muscular:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _capitalizeWords(exercise['bodyPart']),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'Músculo Alvo:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _capitalizeWords(exercise['target']),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'Equipamento:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _capitalizeWords(exercise['equipment']),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Instruções:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...List.generate(
                (exercise['instructions'] as List).length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${index + 1}. ', style: const TextStyle(fontSize: 16)),
                      Expanded(
                        child: Text(
                          exercise['instructions'][index],
                          style: const TextStyle(fontSize: 16),
                        ),
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
}