
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/models/friend.dart';

import 'profile_screen.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  FriendScreenState createState() => FriendScreenState();
}

class FriendScreenState extends State<FriendScreen> {
  final List<Friend> _friends = [
    Friend(name: 'Alice', icon: Icons.person),
    Friend(name: 'Bob', icon: Icons.pets),
    Friend(name: 'Charlie', icon: Icons.star),
  ];
  final TextEditingController _controller = TextEditingController();

  final List<IconData> _iconOptions = [
    Icons.person,
    Icons.pets,
    Icons.star,
    Icons.favorite,
    Icons.anchor,
    Icons.bug_report,
    Icons.cake,
    Icons.camera,
    Icons.lightbulb,
  ];

  void _addFriend() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        final randomIcon = _iconOptions[Random().nextInt(_iconOptions.length)];
        _friends.add(Friend(name: _controller.text, icon: randomIcon));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('フレンド'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'フレンド名',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addFriend,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _friends.length,
              itemBuilder: (context, index) {
                final friend = _friends[index];
                return ListTile(
                  leading: Icon(friend.icon),
                  title: Text(friend.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(friend: friend),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
