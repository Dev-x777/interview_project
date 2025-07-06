import 'package:flutter/material.dart';

class BottomDrawer extends StatelessWidget {
  const BottomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      {
        "image": 'assets/A.png',
        "title": "Habit",
        "desc": "Activity that repeats over time with detailed tracking and statistics."
      },
      {
        "image": 'assets/B.png',
        "title": "Recurring Task",
        "desc": "Activity that repeats over time with detailed tracking and statistics."
      },
      {
        "image": 'assets/C.png',
        "title": "Task",
        "desc": "Single instance activity without tracking over time."
      },
      {
        "image": 'assets/D.png',
        "title": "Goal of the Day",
        "desc": "A specific target set to achieve within a single day."
      },
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 50,
            height: 4,
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          // Option List
          ...List.generate(options.length, (index) {
            final item = options[index];
            final isLast = index == options.length - 1;

            return Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 6),
                  onTap: () => Navigator.pop(context),
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBFAFF),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(item['image']!),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: Text(
                    item['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      item['desc']!,
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.4,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.deepPurple.shade700,
                  ),
                ),
                if (!isLast)
                  const Divider(
                    thickness: 1,
                    height: 0,
                    indent: 60,
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
