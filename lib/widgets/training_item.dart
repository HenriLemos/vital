import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrainingItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function(int) onDelete;
  final Function(int, bool) onToggleComplete;

  const TrainingItem({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onToggleComplete,
  });

  String _formatDate(String isoString) {
    try {
      final dateTime = DateTime.parse(isoString);
      return DateFormat('dd/MM/yyyy - HH:mm').format(dateTime);
    } catch (e) {
      return isoString;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = item['completed'] == 1;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isCompleted ? Colors.green : Colors.transparent,
          width: isCompleted ? 2 : 0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: Colors.orange,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    _formatDate(item['createdAt']),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Checkbox(
                  value: isCompleted,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    onToggleComplete(item['id'], value ?? false);
                  },
                  visualDensity: VisualDensity.compact,
                ),
                Text(
                  isCompleted ? 'Concluído' : 'Concluído',
                  style: TextStyle(
                    fontSize: 12,
                    color: isCompleted ? Colors.green : Colors.grey[600],
                    fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: 20,
                  ),
                  onPressed: () => onDelete(item['id']),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                item['text'],
                style: TextStyle(
                  fontSize: 16,
                  decoration: isCompleted ? TextDecoration.lineThrough : null,
                  color: isCompleted ? Colors.grey : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 