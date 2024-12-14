import 'package:flutter/material.dart';
import 'package:todo/task/model/task.dart';

class DueDateView extends StatelessWidget {
  final DateTime _dueDate;
  DueDateView({super.key, required Task task}) : _dueDate = task.dueDate;

  String _dayOfWeek(int dayIndex) {
    switch (dayIndex) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "Unknown";
    }
  }

  String _monthOfYear(int monthIndex) {
    switch (monthIndex) {
      case 1:
        return "January";
      case 2:
        return "Feburary";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _dayOfWeek(_dueDate.weekday).substring(0, 3),
            style: TextStyle(
              color: Color.fromRGBO(0x68, 0x68, 0x68, 1.0),
              fontSize: 15,
            ),
          ),
          Text(
            _dueDate.day.toString(),
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            _monthOfYear(_dueDate.month).substring(0, 3),
            style: TextStyle(
              color: Color.fromRGBO(0, 0xC2, 0xB9, 1.0),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
