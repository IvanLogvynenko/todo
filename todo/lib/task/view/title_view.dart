import 'package:flutter/material.dart';
import 'package:todo/task/model/task.dart';

class TitleView extends StatelessWidget {
  final Task _task;
  const TitleView({super.key, required Task task}) : _task = task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _task.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(padding: EdgeInsets.all(4)),
        Text(
          _task.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(0x48, 0x48, 0x48, 1.0),
          ),
        ),
      ],
    );
  }
}
