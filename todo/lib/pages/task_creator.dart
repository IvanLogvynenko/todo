import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/task/model/difficulty.dart';
import 'package:todo/task/model/task.dart';
import 'package:todo/task/model/task_type.dart';
import 'package:todo/task/provider/task_provider.dart';

class TaskCreator extends StatefulWidget {
  const TaskCreator({super.key});

  @override
  State<TaskCreator> createState() => _TaskCreatorState();
}

class _TaskCreatorState extends State<TaskCreator> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleInputController = TextEditingController();
  final _descriptionInputController = TextEditingController();

  Difficulty _selectedDifficulty = Difficulty.unpredictable;
  TaskType _taskType = TaskType.other;
  DateTime _dueDate = DateTime.now().add(Duration(days: 7));
  int _priority = 0;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextFormField(
            controller: _titleInputController,
            decoration: const InputDecoration(label: Text("Task title")),
            validator: (value) =>
                value == null || value.isEmpty ? "Enter valid title" : null,
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _descriptionInputController,
            decoration: const InputDecoration(
              label: Text("Description"),
              errorMaxLines: 3,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          DropdownButtonFormField<Difficulty>(
            value: _selectedDifficulty,
            decoration: const InputDecoration(label: Text("Difficulty")),
            items: Difficulty.values
                .map(
                  (value) => DropdownMenuItem(
                    value: value,
                    child: Text(value.level),
                  ),
                )
                .toList(),
            onChanged: (value) => setState(() {
              _selectedDifficulty = value!;
            }),
          ),
          const SizedBox(
            height: 12.0,
          ),
          DropdownButtonFormField<TaskType>(
            value: _taskType,
            decoration: const InputDecoration(label: Text("TaskType")),
            items: TaskType.values
                .map(
                  (value) => DropdownMenuItem(
                    value: value,
                    child: Text(value.type),
                  ),
                )
                .toList(),
            onChanged: (value) => setState(
              () {
                _taskType = value!;
              },
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              Text("Due date: ${_dueDate.toLocal().toString().split(" ")[0]}"),
              const Spacer(),
              TextButton(
                child: const Text("Pick date"),
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      _dueDate = picked;
                    });
                  }
                },
              )
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              const Text('Priority:'),
              Expanded(
                child: Slider(
                  value: _priority.toDouble(),
                  min: 0,
                  max: 5,
                  divisions: 4,
                  label: _priority.toString(),
                  onChanged: (val) => setState(() => _priority = val.round()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              var message = "";
              if (_formKey.currentState!.validate()) {
                taskProvider.addTask(Task(
                    title: _titleInputController.text,
                    description: _descriptionInputController.text,
                    dueDate: _dueDate,
                    priority: _priority,
                    taskType: _taskType));
                message = "Task saved successfully!";
              } else {
                message = "Invalid submission";
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(message),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Create Task'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleInputController.dispose();
    _descriptionInputController.dispose();
    super.dispose();
  }
}
