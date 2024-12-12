import 'package:json_annotation/json_annotation.dart';
import 'package:todo/task/model/difficulty.dart';
import 'package:todo/task/model/task_type.dart';

part "task.g.dart";

@JsonSerializable()
class Task {
  // @JsonKey(includeToJson: false)
  // ignore: non_constant_identifier_names
  static int ID = 0;
  final int _id;
  final String _title;
  final String _description;
  final Difficulty _difficulty;
  final TaskType _taskType;
  final DateTime _dueDate;
  final int _priority;

  Task(
      {required String title,
      String description = "",
      Difficulty difficulty = Difficulty.unpredictable,
      TaskType taskType = TaskType.other,
      DateTime? dueDate,
      int priority = 3,
      int? id})
      : _title = title,
        _description = description,
        _difficulty = difficulty,
        _taskType = taskType,
        _dueDate = dueDate ?? DateTime.now().add(Duration(days: 7)),
        _priority = priority,
        _id = id ?? ID++;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  Difficulty get difficulty => _difficulty;
  TaskType get taskType => _taskType;
  DateTime get dueDate => _dueDate;
  int get priority => _priority;
}

