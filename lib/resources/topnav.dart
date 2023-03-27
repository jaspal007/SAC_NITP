import 'package:flutter/material.dart';

enum dates { yesterday, today, tommorow }
dates _item = dates.today;

class MyTopNav extends StatefulWidget {
  const MyTopNav({super.key});

  @override
  State<StatefulWidget> createState()=> MyTopNavState();
}

class MyTopNavState extends State<MyTopNav>{

  @override
  Widget build(BuildContext context) {
    final mainScreen = MediaQuery.of(context).size.height;
    final height = mainScreen - MediaQuery.of(context).padding.bottom;
    return Container(
      width: double.infinity,
      height: height * 0.11,
      child: Row(
        children: [
          PopupMenuButton(
            initialValue: _item,
            onSelected: (dates date) {
              setState(() {
                _item = date;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<dates>>[
              const PopupMenuItem(
                value: dates.yesterday,
                child: Text('yesterday'),
              ),
              const PopupMenuItem(
                value: dates.yesterday,
                child: Text('yesterday'),
              ),
              const PopupMenuItem(
                value: dates.yesterday,
                child: Text('yesterday'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
