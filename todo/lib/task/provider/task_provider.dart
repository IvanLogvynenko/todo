import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/task/model/task.dart';
import 'package:todo/task/services/server_storage_service.dart';
import 'package:todo/task/services/shared_prefs_service.dart';

// Loads tasks from the shared storage
class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  final ServerStorageService _serverStorageService;
  final SharedPrefsTaskService _prefsTaskService;

  bool _disposable = true;

  List<Task> get tasks => UnmodifiableListView(_tasks);

  TaskProvider._(this._prefsTaskService, this._serverStorageService);

  static Future<TaskProvider> create() async {
    final prefsService = SharedPrefsTaskService();
    final serverService = ServerStorageService();

    final provider = TaskProvider._(prefsService, serverService);

    final prefsId = await prefsService.getID();
    final serverId = await serverService.getId();

    final tasks = await prefsService.loadTasks();
    provider.addTasks(tasks);
    Task.ID = prefsId;

    if (serverId > prefsId) {
      var tasksServer = await serverService.loadTasks();
      provider._tasks.clear();
      provider.addTasks(tasksServer);
      Task.ID = serverId;
    }

    return provider;
  }

  Future<void> save() async {
    await _prefsTaskService.saveId(Task.ID);
    await _prefsTaskService.saveTasks(tasks);
    await _serverStorageService.saveId(Task.ID);
    await _serverStorageService.saveTasks(tasks);
  }

  @override
  void dispose() {
    _disposable = false;
    save().then((value) {
      _disposable = true;
    });
    while (!_disposable) {}
    super.dispose();
  }

  addTask(Task task) {
    _tasks.add(task);
    _disposable = false;
    save().then((value) {
      _disposable = true;
    });
    notifyListeners();
  }

  void addTasks(List<Task> tasks) {
    tasks.forEach(addTask);
  }

  removeTask(Task task) {
    if (!_tasks.remove(task)) {
      throw Exception('I`m so mentally ill');
    }
    _disposable = false;
    save().then((value) {
      _disposable = true;
    });
    notifyListeners();
  }

  void updateTask(Task updatedTask) {
    _tasks.removeWhere((task) {
      return task.id == updatedTask.id;
    });
    _tasks.add(updatedTask);
    _disposable = false;
    save().then((value) {
      _disposable = true;
    });
    notifyListeners();
  }
}
