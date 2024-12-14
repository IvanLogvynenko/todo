import 'package:flutter/material.dart';
import 'package:todo/task/model/task.dart';
import 'package:todo/task/model/task_type.dart';

class TaskTypeView extends StatelessWidget {
  final TaskType _taskType;
  TaskTypeView({super.key, required Task task}) : _taskType = task.taskType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 125,
      decoration: BoxDecoration(
        color: _taskType.color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Text(
          _taskType.type,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
