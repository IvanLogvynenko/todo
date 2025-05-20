// import 'dart:convert';
// import 'dart:io';

import 'package:todo/task/model/task.dart';
import 'package:todo/task/services/server_storage_service.dart';

void main() async {
  final data = await ServerStorageService().loadTasks();
  for (var value in data) {
    // ignore: avoid_print
    print(value.toString());
  }
  Task additionalTask = Task(title: "Title");
  data.add(additionalTask);
  // ServerStorageService().saveTasks(data);
  var storage = ServerStorageService();
  await storage.saveTasks([additionalTask]);
}
