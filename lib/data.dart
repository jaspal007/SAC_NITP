import 'package:flutter/material.dart';
import 'package:sac_nitp/admin.dart';
import 'package:sac_nitp/result.dart';

List<Widget> Pages = <Widget>[
  const MyAdmin(),
  const MyResult(),
];
int _currIndex = 0;

class MyData extends StatefulWidget {
  const MyData({super.key});

  @override
  State<StatefulWidget> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Pages[_currIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black54,
          iconSize: 30,
          fixedColor: Colors.white,
          currentIndex: _currIndex,
          onTap: (int index) {
            setState(() {
              _currIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Match',
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
              label: 'Result',
              icon: Icon(
                Icons.star_border_outlined,
                color: Colors.amber,
              ),
              activeIcon: Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
