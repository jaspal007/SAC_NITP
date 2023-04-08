import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sac_nitp/utility/global_variable.dart' as globals;

globals.GlobalVariable _globalVariable = globals.GlobalVariable();
List<String> info = [
  'Name',
  'Roll No',
  'Mobile',
  'Email',
];

class MyContactCard extends StatefulWidget {
  final String game;
  final int index;
  final String pos;
  const MyContactCard({
    super.key,
    required this.game,
    required this.index,
    required this.pos,
  });

  @override
  State<MyContactCard> createState() => _MyContactCardState();
}

class _MyContactCardState extends State<MyContactCard> {
  @override
  Widget build(BuildContext context) {
    final game = widget.game;
    final idx = widget.index;
    final pos = widget.pos;
    List<Map<String, String>>? getCard = _globalVariable.getCard(
      game,
      idx,
      pos,
    );
    return Container(
        height: ScreenUtil().setHeight(0.1.sh),
        width: ScreenUtil().setWidth(0.8.sw),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Text('${info[0]}: ${getCard?[0]['Name']}'),
            Text('${info[1]}: ${getCard?[1]['RollNum']}'),
            Text('${info[2]}: ${getCard?[2]['Mob']}'),
            Text('${info[3]}: ${getCard?[3]['email']}'),
          ],
        ));
  }
}

class $ {}
