import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/task/model/task.dart';

// Loads tasks from the shared storage
class TaskProvider extends ChangeNotifier {
  final Map<int, Task> _tasks = HashMap<int, Task>();

  Map<int, Task> get tasks => UnmodifiableMapView(_tasks);

  void addTask(Task task) {
    _tasks[task.id] = task;
    notifyListeners();
  }

  // Method to remove a task
  void removeTask(Task task) {
    if (_tasks.remove(task.id) == null) {
      throw Exception('Task not found');
    }
    notifyListeners();
  }

  // Method to update a task
  void updateTask(Task updatedTask) {
    if (_tasks.containsKey(updatedTask.id)) {
      _tasks[updatedTask.id] = updatedTask;
      notifyListeners();
    } else {
      throw Exception('Task not found');
    }
  }
}
