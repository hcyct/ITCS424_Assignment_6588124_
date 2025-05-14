
import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  List<Map<String, dynamic>> users = [
    {"name": "Jake", "points": 60},
    {"name": "Mike", "points": 31},
    {"name": "Sam", "points": 9},
  ];

  String currentUser = "You";
  int starsEarned = 0;

  void addPoints(int stars) {
    starsEarned = stars;
    users.insert(0, {"name": currentUser, "points": stars * 5});
    notifyListeners();
  }

  List<Map<String, dynamic>> getUserList() {
    return users;
  }
}