import 'package:todo/task/model/task.dart';

void main() {
  Task task = Task(title: 'some');
  print(task.toJson());
}
