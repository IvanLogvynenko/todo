import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/task/provider/task_provider.dart';
// import 'package:todo/task/model/task.dart';
import 'package:todo/task/view/task_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    final task = taskProvider.tasks.elementAt(index);
                    return Dismissible(
                      key: ValueKey(index),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.redAccent,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (value) {
                        taskProvider.removeTask(task);
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 7.5,
                          horizontal: 5.0,
                        ),
                        child: SizedBox(
                            width: double.infinity,
                            child: TaskView(task: task)),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
