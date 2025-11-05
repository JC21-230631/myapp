
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/add_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/game_screen.dart';
import 'screens/health_screen.dart';
import 'screens/account_screen.dart';
import 'state/health_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CalendarScreen(),
    HealthScreen(),
    AddScreen(),
    GameScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      // When tapping on the Health tab, refresh health data.
      context.read<HealthState>().init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'カレンダー',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'ヘルスケア',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '追加'),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: 'ゲーム'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'アカウント'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
