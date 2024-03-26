import 'package:flutter/material.dart';
import 'package:fresh_flash/view/electronics.dart';
import 'package:fresh_flash/view/headlines.dart';
import 'package:fresh_flash/view/automobiles.dart';
import 'package:fresh_flash/view/sports.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 1;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Headlines(),
    Electronics(),
    Sports()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            icon: Icon(Icons.settings_brightness_outlined),
            label: 'Automobiles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Top Head',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.electric_bolt),
            label: 'Electronics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Sports',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
