import 'package:flutter/material.dart';
import 'package:to_do_app/model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskDone(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }
}
