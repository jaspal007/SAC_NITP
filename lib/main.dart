import 'package:flutter/material.dart';
import 'package:sac_nitp/info.dart';
import 'package:sac_nitp/adminLogin.dart';
import 'home.dart';

List<Widget> Pages = <Widget>[
  const MyHome(),
  const MyInfo(
    game: "KABADDI",
    date: "20 March '23",
    time: "23:00",
    team1: "CSE1",
    team2: "CSE2",
    venue: "Open Air Theatre",
    remarks: "Do join us for the event",
  ),
  AdminLogin(),
];
int _currentIndex = 0;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black54,
          iconSize: 30,
          fixedColor: Colors.white,
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
                color: Colors.green,
              ),
              activeIcon: Icon(
                Icons.sports_cricket_rounded,
                color: Colors.green,
              ),
            ),
            BottomNavigationBarItem(
              label: 'TCF',
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
      ),
    );
  }
}
