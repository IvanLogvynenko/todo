import 'package:flutter/material.dart';
import 'package:todo/task/model/difficulty.dart';
import 'package:todo/task/model/task.dart';

class DifficultyView extends StatelessWidget {
  final Difficulty _difficulty;
  DifficultyView({super.key, required Task task})
      : _difficulty = task.difficulty;

  final double _roundness = 15.0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(_roundness),
        bottomLeft: Radius.circular(_roundness),
        topRight: Radius.zero,
        bottomRight: Radius.zero,
      ),
      child: Container(
        width: 10,
        height: double.infinity,
        color: _difficulty.color,
      ),
    );
  }
}
