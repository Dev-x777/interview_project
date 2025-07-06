import 'package:flutter/material.dart';
import '../models/task_model.dart';
import 'dart:math';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onTap;

  TaskItem({
    super.key,
    required this.task,
    required this.onTap,
  });

  final Random _random = Random();

  Color getTagColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'must':
        return const Color(0xFF4A80F0); // Blue
      case 'important':
        return const Color(0xFFFFA500); // Orange
      default:
        return Colors.grey;
    }
  }

  Color getRandomTimeColor() {
    final colors = [
      Colors.yellow.shade400,
      Colors.green.shade400,
      Colors.purple.shade400,
      Colors.blue.shade400,
    ];
    return colors[_random.nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    final timeColor = getRandomTimeColor();
    final hasProgress = task.time.contains('/');
    String displayTime = task.time;
    String progressText = '';

    if (hasProgress) {
      final parts = task.time.split('  ');
      if (parts.length > 1) {
        displayTime = parts[0];
        progressText = parts[1];
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // made 16 → 12
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4), // slightly reduced
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Image.asset(
                  task.iconPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Task Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Tags and Time
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Time
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: timeColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            displayTime,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: timeColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),

                        // Tags
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            task.tags.join(" | "),
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                              color: getTagColor(task.tags.first),
                            ),
                          ),
                        ),

                        // Progress (optional)
                        if (hasProgress && progressText.isNotEmpty) ...[
                          const SizedBox(width: 8),
                          Text(
                            progressText,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Completion Circle
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 4),
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: task.isCompleted ? Colors.green : Colors.transparent,
                  border: Border.all(
                    color: task.isCompleted ? Colors.green : Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: task.isCompleted
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
