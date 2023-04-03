import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sac_nitp/upload_match.dart';
import 'package:sac_nitp/firebase/storage_methods.dart';
import 'package:sac_nitp/upload_result.dart';
import 'package:sac_nitp/upload_scoreCard.dart';
import 'package:sac_nitp/utility/snackbar.dart';

import 'firebase/firestore_methods.dart';
import 'resources/image_picker.dart';

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
                color: Colors.teal,
              ),
              activeIcon: Icon(
                Icons.sports_cricket_rounded,
                color: Colors.teal,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyScore(),
              ),
            );
          },
          child: const Icon(
            Icons.calendar_view_day,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
