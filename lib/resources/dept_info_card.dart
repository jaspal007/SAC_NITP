import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sac_nitp/dept_info.dart';
import 'package:sac_nitp/utility/global_variable.dart' as globals;
import 'package:sac_nitp/women/women_info.dart';

globals.GlobalVariable _globalVariable = globals.GlobalVariable();
Map<String, String> images = _globalVariable.getDeptImages();

class MyDeptCard extends StatefulWidget {
  final String dept;
  const MyDeptCard({
    super.key,
    required this.dept,
  });

  @override
  State<MyDeptCard> createState() => _MyDeptCardState();
}

class _MyDeptCardState extends State<MyDeptCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => (widget.dept == 'Women')
                ? const WomenInfo()
                : DeptInfo(dept: widget.dept),
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
            image: AssetImage(images[widget.dept]!),
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
            widget.dept,
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
