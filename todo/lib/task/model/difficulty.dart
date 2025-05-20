import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum Difficulty {
  easy("easy", Color.fromRGBO(72, 255, 127, 1)),
  medium("medium", Color.fromRGBO(255, 238, 90, 1)),
  hard("hard", Color.fromRGBO(255, 114, 114, 1)),
  extreme("extreme", Color.fromRGBO(255, 0, 0, 1)),
  teamWork("team work", Color.fromRGBO(225, 127, 255, 1)),
  unpredictable("unpredictable", Color.fromRGBO(119, 166, 255, 1));

  final String _level;
  final Color _color;

  const Difficulty(this._level, this._color);

  Color get color => _color;
  String get level => _level;
}
