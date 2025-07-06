class Task {
  final String title;
  final String time;
  final List<String> tags;
  final String iconPath;
  bool isCompleted;

  Task({
    required this.title,
    required this.time,
    required this.tags,
    required this.iconPath,
    this.isCompleted = false,
  });
}
