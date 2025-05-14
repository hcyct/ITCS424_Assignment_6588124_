import 'package:flutter/material.dart';
import 'task_rating_page.dart';
import 'user_data.dart';

void main() {
  runApp(TaskerApp());
}

class TaskerApp extends StatelessWidget {
  final UserData userData = UserData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskRatingPage(
        taskDeadline: DateTime.now().add(Duration(hours: 24)),
        taskCompleted: DateTime.now(),
        userData: userData,
      ),
    );
  }
}
