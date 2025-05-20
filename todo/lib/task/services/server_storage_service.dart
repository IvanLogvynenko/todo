import 'dart:convert';
import 'dart:io';

// import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:todo/task/model/task.dart';

class ServerStorageService {
  final _uri = "https://ivanlogvynenko.ddns.net/todo-application-endpoint";
  ServerStorageService();

  Future<List<Task>> loadTasks() async {
    HttpClient client = HttpClient();
    var logger = Logger("ServerStorageService.loadTasks");
    HttpClientRequest request = await client.getUrl(Uri.parse("$_uri?q=tasks"));
    HttpClientResponse response = await request.close();
    logger.info("executed");
    if (response.statusCode == 200) {
      final body = await response.transform(utf8.decoder).join();
      final jsonData = jsonDecode(body);
      logger.info(jsonData);
      if (jsonData is Map<String, dynamic>) {
        client.close();
        return (jsonData["Result"] as List<dynamic>)
            .map((json) => Task.fromJson(json))
            .toList();
      }
    } else {
      throw HttpException('Failed to load tasks: ${response.statusCode}');
    }
    throw HttpException("Failed to retrieve data from server");
  }

  saveTasks(List<Task> tasks) async {
    HttpClient client = HttpClient();
    var logger = Logger("ServerStorageService.saveTasks");
    HttpClientRequest request = await client.postUrl(Uri.parse(_uri));
    final body = jsonEncode({
      "values":
          jsonEncode({"tasks": tasks.map((task) => task.toJson()).toList()})
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

  Future<int> getId() async {
    HttpClient client = HttpClient();
    HttpClientRequest request =
        await client.getUrl(Uri.parse("$_uri?q=taskId"));
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      final body = await response.transform(utf8.decoder).join();
      final jsonData = jsonDecode(body);
      if (jsonData is Map<String, dynamic>) {
        client.close();
        return jsonData["Result"] ?? 0;
      }
    } else {
      throw HttpException('Failed to load tasks: ${response.statusCode}');
    }
    throw HttpException("Failed to retrieve data from server");
  }

  saveId(int id) async {
    HttpClient client = HttpClient();
    HttpClientRequest request = await client.postUrl(Uri.parse(_uri));
    request.write(jsonEncode({
      "values": jsonEncode({"taskId": id})
    }));
  }
}
