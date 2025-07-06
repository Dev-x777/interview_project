import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/task_item.dart';
import '../widgets/date_selector.dart';
import '../widgets/bottom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedDateIndex = 2;

  final List<Task> tasks = [
    Task(
      title: "Schedule a meeting with Harshit Sir",
      time: "09:00 AM",
      tags: ["Habit", "Must"],
      iconPath: "assets/1.png",
      isCompleted: true,
    ),
    Task(
      title: "2.5 Hours Simran and Meditation",
      time: "09:00 AM",
      tags: ["Habit", "Must"],
      iconPath: "assets/2.png",
    ),
    Task(
      title: "Save 200 Rupees Daily",
      time: "12:00 PM",
      tags: ["Habit", "Must"],
      iconPath: "assets/3.png",
    ),
    Task(
      title: "Walk 10k Step Daily",
      time: "07:00 AM",
      tags: ["12/31", "Habit", "Important"],
      iconPath: "assets/4.png",
    ),
    Task(
      title: "Buy Sunflower for Mumma",
      time: "11:00 AM",
      tags: ["0/1", "Task", "Important"],
      iconPath: "assets/5.png",
    ),
    Task(
      title: "Make Mandala and Colour Daily",
      time: "07:30 PM",
      tags: ["12/30", "Task", "Important"],
      iconPath: "assets/6.png",
    ),
  ];

  final List<String> quotes = [
    "You must do the things you think you cannot do.",
    "Believe in yourself and all that you are.",
    "The future depends on what you do today.",
    "Start where you are. Use what you have. Do what you can.",
  ];

  String get todaysQuote {
    final day = DateTime.now().day;
    return quotes[day % quotes.length];
  }

  double get progress {
    if (tasks.isEmpty) return 0.0;
    final completed = tasks.where((t) => t.isCompleted).length;
    return completed / tasks.length;
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  void showBottomDrawer() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => const BottomDrawer(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 12,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            Image.asset(
              'assets/logo_1.png',
              height: 60,
              width: 80,
              fit: BoxFit.contain,
            ),
          ],
        ),
        actions: const [
          Icon(Icons.search_rounded),                // Slightly softer than Icons.search
          SizedBox(width: 12),
          Icon(Icons.event_note_rounded),           // Better than calendar_today
          SizedBox(width: 12),
          Icon(Icons.question_mark_rounded),            // Better alternative to more_vert
          SizedBox(width: 16),
        ],

      ),

      body: Column(
        children: [
          const SizedBox(height: 16),

          // Date Selector
          DateSelector(
            selectedIndex: selectedDateIndex,
            onSelect: (i) => setState(() => selectedDateIndex = i),
          ),

          // Quote + Progress
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Today's Quote",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    todaysQuote,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Progress: ${(progress * 100).toStringAsFixed(0)}%",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.deepPurple,
                    minHeight: 6,
                  ),
                ],
              ),
            ),
          ),

          // Task List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: tasks.length,
              itemBuilder: (_, i) => TaskItem(
                task: tasks[i],
                onTap: () => toggleTask(i),
              ),
            ),
          ),
        ],
      ),

      // Floating Plus Button
      floatingActionButton: RawMaterialButton(
        onPressed: showBottomDrawer,
        elevation: 4,
        shape: const CircleBorder(),
        fillColor: Colors.transparent,
        child: Image.asset(
          'assets/plus.png',
          width: 64,
          height: 64,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
