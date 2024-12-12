// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      title: json['title'] as String,
      description: json['description'] as String? ?? "",
      difficulty:
          $enumDecodeNullable(_$DifficultyEnumMap, json['difficulty']) ??
              Difficulty.unpredictable,
      taskType: $enumDecodeNullable(_$TaskTypeEnumMap, json['taskType']) ??
          TaskType.other,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      priority: (json['priority'] as num?)?.toInt() ?? 3,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
      'taskType': _$TaskTypeEnumMap[instance.taskType]!,
      'dueDate': instance.dueDate.toIso8601String(),
      'priority': instance.priority,
    };

const _$DifficultyEnumMap = {
  Difficulty.easy: 'easy',
  Difficulty.medium: 'medium',
  Difficulty.hard: 'hard',
  Difficulty.extreme: 'extreme',
  Difficulty.teamWork: 'teamWork',
  Difficulty.unpredictable: 'unpredictable',
};

const _$TaskTypeEnumMap = {
  TaskType.lecture: 'lecture',
  TaskType.exercise: 'exercise',
  TaskType.general: 'general',
  TaskType.other: 'other',
};
