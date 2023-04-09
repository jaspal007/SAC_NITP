import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sac_nitp/utility/global_variable.dart' as globals;
import 'package:url_launcher/url_launcher.dart';

globals.GlobalVariable _globalVariable = globals.GlobalVariable();
List<String> info = [
  'Name',
  'Roll No',
  'Mobile',
  'Email',
];

class MyContactCard extends StatefulWidget {
  final String type;
  final int index;
  final String pos;
  final bool dept;
  const MyContactCard({
    super.key,
    required this.type,
    required this.index,
    required this.pos,
    this.dept = false,
  });

  @override
  State<MyContactCard> createState() => _MyContactCardState();
}

class _MyContactCardState extends State<MyContactCard> {
  @override
  Widget build(BuildContext context) {
    final type = widget.type;
    final idx = widget.index;
    final pos = widget.pos;
    List<Map<String, String>>? getCard = (!widget.dept)
        ? _globalVariable.getCard(type, idx, pos)
        : _globalVariable.getDeptCard(type, idx, pos);
    return Container(
        height: ScreenUtil().setHeight(0.2.sh),
        width: ScreenUtil().setWidth(0.8.sw),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Text('${info[0]}: ${getCard?[0]['Name']}'),
            Text('${info[1]}: ${getCard?[1]['RollNum']}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone, size: 20),
                TextButton(
                  onPressed: () async {
                    var url = Uri.parse("tel: ${getCard?[2]['Mob']}");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    '${getCard?[2]['Mob']}',
                    style: const TextStyle(color: Colors.teal),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.mail_rounded, size: 20),
                TextButton(
                  onPressed: () async {
                    String email =
                        Uri.encodeComponent("mail@fluttercampus.com");
                    String subject = Uri.encodeComponent("Hello Flutter");
                    String body =
                        Uri.encodeComponent("Hi! I'm Flutter Developer");
                    var url =
                        Uri.parse("mailto:$email?subject=$subject&body=$body");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    '${getCard?[3]['email']}',
                    style: const TextStyle(color: Colors.teal),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
