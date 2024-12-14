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
      backgroundColor: Color.fromARGB(255, 216, 231, 245),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: taskProvider.tasks.isEmpty
                  ? Center(
                      child: Text(
                          'Every day I`m getting closer\nTo taking a bath with a fucking toaster'),
                    )
                  : ListView.builder(
                      itemCount: taskProvider.tasks.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 7.5,
                            left: 1.5,
                            right: 1.5,
                          ),
                          child: TaskView(
                            task: taskProvider.tasks.values.elementAt(index),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
