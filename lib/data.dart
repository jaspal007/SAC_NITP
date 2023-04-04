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
              ),
              activeIcon: Icon(
                Icons.sports_cricket,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Result',
              icon: Icon(
                Icons.emoji_events_outlined,
              ),
              activeIcon: Icon(
                Icons.emoji_events,
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
            Icons.auto_awesome_mosaic_rounded,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
