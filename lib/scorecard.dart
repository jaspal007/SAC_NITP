import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:sac_nitp/upload_scoreCard.dart';

import 'utility/global_variable.dart' as globals;

globals.GlobalVariable globalVariable = globals.GlobalVariable();


class MyScoreCard extends StatefulWidget {
  MyScoreCard({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MyScoreCardState();
}

class _MyScoreCardState extends State<MyScoreCard> {
  String latestImageUrl = '';
  StorageService storageService = StorageService();

  @override
  void initState() {
    super.initState();
    loadLatestImageUrl(); // call function to load latest image URL when widget is created
  }

  Future<void> loadLatestImageUrl() async {
    String photoUrl = await storageService
        .getLatestImageUrl(); // call function to retrieve latest image URL
    setState(() {
      latestImageUrl = photoUrl; // set value of variable in setState() method
    });
  }

  double vertical = 0;
  double horizontal = 0;

  @override
  Widget build(BuildContext context) {
    final mainScreen = MediaQuery.of(context).size.height;
    final height = mainScreen - MediaQuery.of(context).padding.bottom;

    final width = MediaQuery.of(context).size.width;
    const MyScore();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('SAC NITP'),
        ),
        body: InteractiveViewer(
          minScale: 0.1,
          maxScale: 3.0,
          panEnabled: true,
          scaleEnabled: true,
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            child: latestImageUrl != null
                ? Image.network(
                    latestImageUrl,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
