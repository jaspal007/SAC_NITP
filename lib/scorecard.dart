import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyScoreCard extends StatefulWidget {
  const MyScoreCard({super.key});

  @override
  State<StatefulWidget> createState() => _MyScoreCardState();
}

class _MyScoreCardState extends State<MyScoreCard> {
  double vertical = 0;
  double horizontal = 0;
  @override
  Widget build(BuildContext context) {
    final mainScreen = MediaQuery.of(context).size.height;
    final height = mainScreen - MediaQuery.of(context).padding.bottom;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SAC NITP'),
        ),
        body: InteractiveViewer(
          child: Image.asset(
            'lib/assets/intramural_banner.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
