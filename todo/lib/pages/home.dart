import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/task/provider/task_provider.dart';
// import 'package:todo/task/model/task.dart';
import 'package:todo/task/view/task_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    return Column(
      children: [
        Expanded(
          child: taskProvider.tasks.isEmpty
              ? Center(
                  child: Text("You don't have any tasks now. You can rest!!!"),
                )
              : ListView.builder(
                  itemCount: taskProvider.tasks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7.5,
                        horizontal: 5.0,
                      ),
                      child: TaskView(
                        task: taskProvider.tasks.values.elementAt(index),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
