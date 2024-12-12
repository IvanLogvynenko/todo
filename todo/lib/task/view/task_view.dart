import 'package:flutter/material.dart';
import 'package:todo/task/model/task.dart';

class TaskView extends StatelessWidget {
  final Task _task;
  const TaskView({super.key, required Task task}) : _task = task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_task.title, style: TextStyle(fontSize: 20.0)),
          Text(_task.description),
          SizedBox(height: 10.0),
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.blue),
              Text(_task.dueDate.toString()),
              SizedBox(width: 10.0),
              Icon(Icons.access_time, color: Colors.blue),
              Text(_task.dueDate.toString())
            ],
          ),
        ],
      ),
    );
  }
}
