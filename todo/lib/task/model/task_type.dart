import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum TaskType {
  lecture("Lecture", Color.fromRGBO(0xFF, 0xB2, 0xB2, 1)),
  exercise("Exercise", Color.fromRGBO(72, 255, 127, 1)),
  general("General", Color.fromRGBO(225, 127, 255, 1)),
  other("Other", Color.fromRGBO(119, 166, 255, 1));

  final String _type;
  final Color _color;

  const TaskType(this._type, this._color);

  String get type => _type;
  Color get color => _color;
}
