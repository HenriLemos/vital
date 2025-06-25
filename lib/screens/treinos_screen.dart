import 'package:flutter/material.dart';
import 'package:vital/services/database_service.dart';
import 'package:confetti/confetti.dart';
import 'package:vital/widgets/exercise_calendar.dart';
import 'package:vital/widgets/training_input.dart';
import 'package:vital/widgets/training_item.dart';
import 'package:vital/widgets/empty_training_list.dart';

class TreinosScreen extends StatefulWidget {
  const TreinosScreen({super.key});

  @override
  State<TreinosScreen> createState() => _TreinosScreenState();
}

class _TreinosScreenState extends State<TreinosScreen> {
  final TextEditingController _annotationController = TextEditingController();
  final DatabaseService _databaseService = DatabaseService();
  List<Map<String, dynamic>> _annotations = [];
  bool _isLoading = false;
  
  late ConfettiController _confettiController;
  Set<DateTime> _exerciseDays = {};

  @override
  void initState() {
    super.initState();
    _loadAnnotations();
    _confettiController = ConfettiController(duration: const Duration(seconds: 2));
  }
  
  @override
  void dispose() {
    _confettiController.dispose();
    _annotationController.dispose();
    super.dispose();
  }

  Future<void> _loadAnnotations() async {
    setState(() => _isLoading = true);
    final annotations = await _fetchAnnotations();
    setState(() {
      _annotations = annotations;
      _isLoading = false;
      _updateExerciseDays();
    });
  }

  void _updateExerciseDays() {
    _exerciseDays = _annotations.map((annotation) {
      final date = DateTime.parse(annotation['createdAt']);
      return DateTime(date.year, date.month, date.day);
    }).toSet();
  }

  void _onDaySelected(DateTime selectedDay) {
    print('Selected day: $selectedDay');
  }

  Future<List<Map<String, dynamic>>> _fetchAnnotations() async {
    final db = await _databaseService.database;
    return await db.query('annotations', orderBy: 'createdAt DESC');
  }

  Future<void> _saveAnnotation() async {
    if (_annotationController.text.isEmpty) return;

    final db = await _databaseService.database;
    await db.insert('annotations', {
      'text': _annotationController.text,
      'createdAt': DateTime.now().toIso8601String(),
      'completed': 0,
    });

    _annotationController.clear();
    _loadAnnotations();
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Treino salvo com sucesso!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _deleteAnnotation(int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remover treino'),
        content: const Text('Tem certeza que deseja remover este treino?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Remover', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    
    if (confirm != true) return;
    
    final db = await _databaseService.database;
    await db.delete('annotations', where: 'id = ?', whereArgs: [id]);
    _loadAnnotations();
  }
  
  Future<void> _toggleTrainingCompleted(int id, bool completed) async {
    final db = await _databaseService.database;
    await db.update(
      'annotations',
      {'completed': completed ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
    
    if (completed) {
      _confettiController.play();
      
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Treino Concluído! 🎉', 
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Parabéns por concluir seu treino!',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Image.asset(
                  'assets/images/achievement.png',
                  height: 120,
                  width: 120,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.fitness_center,
                    size: 80,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Continuar'),
              ),
            ],
          ),
        );
      }
    }
    
    _loadAnnotations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Crie Seu Treino', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ExerciseCalendar(
                  exerciseDays: _exerciseDays,
                  onDaySelected: _onDaySelected,
                ),
                const SizedBox(height: 16),
                
                TrainingInput(
                  controller: _annotationController,
                  onSave: _saveAnnotation,
                ),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                  child: Row(
                    children: const [
                      Icon(Icons.fitness_center, color: Colors.orange),
                      SizedBox(width: 8),
                      Text(
                        'Treinos Salvos',
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                
                _isLoading
                    ? const Center(child: CircularProgressIndicator(color: Colors.orange))
                    : _annotations.isEmpty
                        ? const EmptyTrainingList()
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            itemCount: _annotations.length,
                            itemBuilder: (context, index) {
                              return TrainingItem(
                                item: _annotations[index],
                                onDelete: _deleteAnnotation,
                                onToggleComplete: _toggleTrainingCompleted,
                              );
                            },
                          ),
              ],
            ),
          ),
          
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveAnnotation,
        backgroundColor: Colors.orange,
        child: const Icon(Icons.save),
        tooltip: 'Salvar treino',
      ),
    );
  }
}