import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:todo/task/model/task.dart';

void main() async {
  Task task = Task(title: "someTask");
  final tasks = [task];
  HttpClient client = HttpClient();
  var logger = Logger("ServerStorageService.saveTasks");
  HttpClientRequest request = await client.postUrl(
      Uri.parse("https://ivanlogvynenko.ddns.net/todo-application-endpoint"));
  final body = jsonEncode({
    "values": jsonEncode({"tasks": tasks.map((task) => task.toJson()).toList()})
  });
  request.write(body);
  HttpClientResponse response = await request.close();
  String responseBody = await response.transform(utf8.decoder).join();
  logger.info("Status code: ${response.statusCode}");
  logger.info("Response body: $responseBody");
  if (response.statusCode < 200 || response.statusCode >= 300) {
    throw HttpException("Failed to save tasks to server");
  }
  logger.info("Data submitted successfully");
  client.close();
}
