import 'package:flutter/material.dart';
import 'package:todo/custom_widgets/separator.dart';
import 'package:todo/task/model/task.dart';
import 'package:todo/task/view/difficulty_view.dart';
import 'package:todo/task/view/due_view.dart';
import 'package:todo/task/view/task_type_view.dart';
import 'package:todo/task/view/title_view.dart';

class TaskView extends StatelessWidget {
  final Task _task;
  const TaskView({super.key, required Task task}) : _task = task;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: SizedBox(
        width: 300,
        height: 115,
        child: Row(
          children: [
            DifficultyView(task: _task),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: TitleView(task: _task),
                  ),
                  Expanded(
                    flex: 1,
                    child: TaskTypeView(task: _task),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                ],
              ),
            ),
            Separator(),
            DueDateView(task: _task),
          ],
        ),
      ),
    );
  }
}
