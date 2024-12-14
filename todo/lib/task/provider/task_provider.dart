import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/task/model/difficulty.dart';
import 'package:todo/task/model/task.dart';
import 'package:todo/task/model/task_type.dart';

// Loads tasks from the shared storage
class TaskProvider extends ChangeNotifier {
  final Map<int, Task> _tasks = HashMap<int, Task>();

  Map<int, Task> get tasks => UnmodifiableMapView(_tasks);

  TaskProvider() {
    addTask(Task(
      title: "Machine Learning",
      description: "dfghjkl",
      difficulty: Difficulty.easy,
      taskType: TaskType.exercise,
    ));
    addTask(Task(
      title: "GBS",
      description: "dfghjkl",
      difficulty: Difficulty.medium,
      taskType: TaskType.exercise,
    ));
    addTask(Task(
      title: "GBS",
      description: "dfghjkl",
      difficulty: Difficulty.teamWork,
      taskType: TaskType.exercise,
    ));
    addTask(Task(
      title: "GBS",
      description: "dfghjkl",
      difficulty: Difficulty.easy,
      taskType: TaskType.lecture,
    ));
    addTask(Task(
      title: "Math Analisys",
      description: "dfghjkl",
      difficulty: Difficulty.hard,
      taskType: TaskType.lecture,
    ));
    addTask(Task(
      title: "Math Analisys",
      description: "dfghjkl",
      difficulty: Difficulty.extreme,
      taskType: TaskType.exercise,
    ));
    addTask(Task(
      title: "Find Eye Doctor",
      description: "dfghjkl",
      difficulty: Difficulty.easy,
      taskType: TaskType.general,
    ));
  }

  void addTask(Task task) {
    _tasks[task.id] = task;
    notifyListeners();
  }

  // Method to remove a task
  void removeTask(Task task) {
    if (_tasks.remove(task.id) == null) {
      throw Exception('I`m so mentally ill');
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
