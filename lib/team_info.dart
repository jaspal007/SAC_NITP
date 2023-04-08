import 'package:flutter/material.dart';
import 'utility/global_variable.dart' as globals;

globals.GlobalVariable _globalVariable = globals.GlobalVariable();

class TeamInfo extends StatefulWidget {
  final String game;
  const TeamInfo({
    super.key,
    required this.game,
  });

  @override
  State<TeamInfo> createState() => _TeamInfoState();
}

class _TeamInfoState extends State<TeamInfo> {
  @override
  Widget build(BuildContext context) {
    String sports = widget.game;
    List<Map<String, List<Map<String, String>>>> info =
        _globalVariable.getInfo(sports)!;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('game: $sports'),
              Text('Coordinator: ${info[0]['Coordinator']![0]['Name']}'),
              Text('RollNum: ${info[0]['Coordinator']![1]['RollNum']}'),
              Text('Mob: ${info[0]['Coordinator']![2]['Mob']}'),
              Text('email: ${info[0]['Coordinator']![3]['email']}'),
            ],
          ),
        ),
      ),
    );
  }
}
