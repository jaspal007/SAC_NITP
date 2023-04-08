import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sac_nitp/resources/contact_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'utility/global_variable.dart' as globals;

globals.GlobalVariable _globalVariable = globals.GlobalVariable();
List<String> position = [
  'Coordinator',
  'Co_ordinator1',
  'Co_ordinator2',
  'Member1',
  'Member2',
  'Member3',
  'Member4',
  'Member5',
];

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
    final mainScreen = MediaQuery.of(context).size.height;
    final height = mainScreen - MediaQuery.of(context).padding.bottom;
    final width = MediaQuery.of(context).size.width;
    String sports = widget.game;
    List<Map<String, List<Map<String, String>>>>? info =
        _globalVariable.getInfo(sports);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            sports,
            style: GoogleFonts.kanit(
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: ScreenUtil().setHeight(0.7.sh),
                  width: ScreenUtil().setWidth(0.9.sw),
                  child: ListView.builder(
                    itemCount: position.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              position[index],
                              style: GoogleFonts.spaceGrotesk(
                                textStyle: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            MyContactCard(
                              game: sports,
                              index: index,
                              pos: position[index],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
