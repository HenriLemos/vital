import 'package:flutter/material.dart';

class EmptyTrainingList extends StatelessWidget {
  const EmptyTrainingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notes_outlined,
            size: 70,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 15),
          Text(
            'Nenhum treino salvo ainda',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
} 