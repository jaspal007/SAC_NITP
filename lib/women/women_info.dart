import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sac_nitp/dept_info.dart';
import 'package:sac_nitp/resources/dept_info_card.dart';
import 'package:sac_nitp/women/women_year_info.dart';
import '../utility/global_variable.dart' as globals;

globals.GlobalVariable _globalVariable = globals.GlobalVariable();
List<String> courseYear = _globalVariable.getYear();
List<String> year = [
  '4th Year',
  '3rd Year',
  '2nd Year',
  '1st Year',
];

class WomenInfo extends StatefulWidget {
  const WomenInfo({
    super.key,
  });

  @override
  State<WomenInfo> createState() => _WomenInfoState();
}

class _WomenInfoState extends State<WomenInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Women',
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
          child: Expanded(
            child: ListView.builder(
              itemCount: year.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(
                      year[index],
                    ),
                    WomenYearInfo(
                      year: courseYear[index],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
