import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/task/model/task.dart';

class SharedPrefsTaskService {
  static const String _tasksKey = 'tasks';
  static const String _taskIDKey = 'tasksId';

  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString(_tasksKey) ?? '[]';
    final List<dynamic> taskList = jsonDecode(tasksJson);
    return taskList.map((e) => Task.fromJson(e)).toList();
  }

  Future<int> getID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_taskIDKey) ?? 0;
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = jsonEncode(tasks.map((e) => e.toJson()).toList());
    await prefs.setString(_tasksKey, tasksJson);
  }

  Future<void> saveId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_taskIDKey, id);
  }
}
