
import 'package:flutter/material.dart';
import 'ranking_page.dart';
import 'user_data.dart';

class TaskRatingPage extends StatefulWidget {
  final DateTime taskDeadline;
  final DateTime taskCompleted;
  final UserData userData;

  TaskRatingPage({
    required this.taskDeadline,
    required this.taskCompleted,
    required this.userData,
  });

  @override
  _TaskRatingPageState createState() => _TaskRatingPageState();
}

class _TaskRatingPageState extends State<TaskRatingPage> {
  int stars = 0;

  @override
  void initState() {
    super.initState();
    stars = calculateStars(widget.taskDeadline, widget.taskCompleted);
    widget.userData.addPoints(stars * 5); // 每颗星5分
  }

  int calculateStars(DateTime deadline, DateTime completed) {
    final difference = deadline.difference(completed).inHours;
    if (difference >= 48) return 5;
    if (difference >= 24) return 4;
    if (difference >= 12) return 3;
    if (difference >= 1) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rating")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index < stars ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 40,
                );
              }),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RankingPage(userData: widget.userData),
                  ),
                );
              },
              child: Text("RANK"),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Rating calculated by: "The earlier you finish your task before the deadline, the more star you get."',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
