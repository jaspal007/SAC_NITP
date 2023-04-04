import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:sac_nitp/result_page.dart';
import 'admin_login.dart';
import 'intramurals.dart';

List<Widget> Pages = <Widget>[
  const MyGame(),
  const MyResHome(),
  const AdminLogin(),
];
int _currentIndex = 0;

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        //fixedColor: Colors.pink,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Intramural'23",
            icon: ImageIcon(
              AssetImage("lib/assets/medal_logo.png"),
              semanticLabel: "Intramural'23",
            ),
          ),
          BottomNavigationBarItem(
            label: 'Results',
            icon: Icon(
              Icons.emoji_events_outlined,
              weight: BorderSide.strokeAlignOutside,
              semanticLabel: 'Results',
            ),
            activeIcon: Icon(
              Icons.emoji_events,
              semanticLabel: 'Results',
            ),
          ),
          BottomNavigationBarItem(
            label: 'Admin',
            icon: Icon(
              Icons.person_2_outlined,
              semanticLabel: 'Admin',
            ),
            activeIcon: Icon(
              Icons.person_2,
              semanticLabel: 'Admin',
            ),
          ),
        ],
      ),
    );
  }
}
