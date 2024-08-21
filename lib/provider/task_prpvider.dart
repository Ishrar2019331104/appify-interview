import 'package:flutter/material.dart';
import 'package:flutter_sandbox/utils/app_colors.dart';

class TaskProvider extends ChangeNotifier {
  List tasks = [
    {
      'date': '2024-08-25',
      'title': 'Landing Page Project',
      'time': '10:00 AM',
      'color': AppColors.primary
    },
    {
      'date': '2024-08-21',
      'title': 'Product Planning',
      'time': '12:00 PM',
      'color': AppColors.secondary
    },
    {
      'date': '2024-08-21',
      'title': 'Design Meeting',
      'time': '2:00 PM',
      'color': Color(0xFFEFF8E0)
    },
    {'title': 'Task 4', 'time': '4:00 PM', 'color': Color(0xFFE0F7FA)},
    {'title': 'Task 5', 'time': '6:00 PM', 'color': Color(0xFFFCE4EC)},
  ];

  void addTask(Map<String, dynamic> task) {
    tasks.add(task);
    notifyListeners();
  }
}
