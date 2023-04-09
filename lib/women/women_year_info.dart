import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sac_nitp/resources/contact_card.dart';
import 'package:sac_nitp/women/women_contact_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sac_nitp/utility/global_variable.dart' as globals;

globals.GlobalVariable _globalVariable = globals.GlobalVariable();

List<String> position = [
  'Coordinator',
  'Co_ordinator',
];

class WomenYearInfo extends StatefulWidget {
  final String year;
  const WomenYearInfo({
    super.key,
    required this.year,
  });

  @override
  State<WomenYearInfo> createState() => _WomenYearInfoState();
}

class _WomenYearInfoState extends State<WomenYearInfo> {
  @override
  Widget build(BuildContext context) {
    final mainScreen = MediaQuery.of(context).size.height;
    final height = mainScreen - MediaQuery.of(context).padding.bottom;
    final width = MediaQuery.of(context).size.width;
    String year = widget.year;
    List<Map<String, List<Map<String, String>>>>? info =
        _globalVariable.getWomenInfo(year);

    return Center(
      child: Container(
        height: ScreenUtil().setHeight(0.5.sh),
        width: ScreenUtil().setWidth(0.9.sw),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  position[0],
                  style: GoogleFonts.spaceGrotesk(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                WomenContactCard(
                  year: year,
                  index: 0,
                  pos: position[0],
                ),
                Text(
                  position[1],
                  style: GoogleFonts.spaceGrotesk(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                WomenContactCard(
                  year: year,
                  index: 1,
                  pos: position[1],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
