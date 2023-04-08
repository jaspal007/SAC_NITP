import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sac_nitp/team_info.dart';
import 'package:sac_nitp/utility/global_variable.dart' as globals;

globals.GlobalVariable _globalVariable = globals.GlobalVariable();
Map<String, String> images = _globalVariable.getImages();

class MyTeamCard extends StatefulWidget {
  final String game;
  const MyTeamCard({
    super.key,
    required this.game,
  });

  @override
  State<MyTeamCard> createState() => _MyTeamCardState();
}

class _MyTeamCardState extends State<MyTeamCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeamInfo(game: widget.game),
          ),
        );
      },
      child: Container(
        width: ScreenUtil().setWidth(0.5.sw),
        height: ScreenUtil().setHeight(0.1.sh),
        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
        margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(images[widget.game]!),
            opacity: 0.4,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(ScreenUtil().setWidth(20)),
          ),
          gradient: const LinearGradient(
            colors: [
              Colors.white10,
              Colors.white10,
              Colors.white10,
              Colors.white30,
              Colors.white70,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Center(
          child: Text(
            widget.game,
            style: GoogleFonts.kanit(
              textStyle: TextStyle(
                fontSize: ScreenUtil().setSp(38),
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
