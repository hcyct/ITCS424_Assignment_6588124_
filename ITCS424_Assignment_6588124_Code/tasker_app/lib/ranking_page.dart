import 'package:flutter/material.dart';
import 'user_data.dart';

class RankingPage extends StatelessWidget {
  final UserData userData;

  RankingPage({required this.userData});

  @override
  Widget build(BuildContext context) {
    // 使用 getUserList 获取所有用户
    final List<Map<String, dynamic>> users = List.from(userData.getUserList());

    // 排序：按分数从高到低
    users.sort((a, b) => b["points"].compareTo(a["points"]));

    return Scaffold(
      appBar: AppBar(title: Text("Ranking")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('${index + 1}. ${user["name"]}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${user["points"]}', style: TextStyle(fontSize: 18)),
                Icon(Icons.star, color: Colors.amber),
              ],
            ),
          );
        },
      ),
    );
  }
}