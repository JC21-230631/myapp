
import 'package:flutter/material.dart';
import 'package:myapp/models/friend.dart';

class ProfileScreen extends StatelessWidget {
  final Friend friend;

  const ProfileScreen({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${friend.name}のプロフィール'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(friend.icon, size: 100),
            const SizedBox(height: 20),
            Text(friend.name, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
