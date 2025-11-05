
import 'package:flutter/material.dart';

import 'friend_screen.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ゲーム'),
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            tooltip: 'フレンド',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FriendScreen()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('ゲームコンテンツ'),
      ),
    );
  }
}
