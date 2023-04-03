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
              label: 'IntraMurals',
              icon: Icon(
                Icons.sports_cricket_outlined,
                color: Colors.red,
              ),
              activeIcon: Icon(
                Icons.sports_cricket_rounded,
                color: Colors.red,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Results',
              icon: Icon(
                Icons.star_border_outlined,
                color: Colors.amber,
              ),
              activeIcon: Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Admin',
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.indigo,
              ),
              activeIcon: Icon(
                Icons.account_circle_sharp,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      );
  }
}