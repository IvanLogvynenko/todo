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
    return Scaffold(
      appBar: AppBar(
        title: Text('Task App'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: taskProvider.tasks.isEmpty
                  ? Center(
                      child: Text('You did that!!!'),
                    )
                  : ListView.builder(
                      itemCount: taskProvider.tasks.length,
                      itemBuilder: (context, index) {
                        return TaskView(
                            task: taskProvider.tasks.values.elementAt(index));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
