import 'dart:convert';
import 'dart:io';

void main() async {
  HttpClient client = HttpClient();
  HttpClientRequest request = await client.postUrl(
      Uri.parse("https://ivanlogvynenko.ddns.net/todo-application-endpoint"));

  request.write(jsonEncode({
    "values": jsonEncode({"data": 10})
  }));
  HttpClientResponse responce = await request.close();
  // ignore: avoid_print
  print(responce.statusCode);
}
