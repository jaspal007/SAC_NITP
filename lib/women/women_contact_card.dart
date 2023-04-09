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

class WomenContactCard extends StatefulWidget {
  final String year;
  final int index;
  final String pos;
  const WomenContactCard({
    super.key,
    required this.year,
    required this.index,
    required this.pos,
  });

  @override
  State<WomenContactCard> createState() => _WomenContactCardState();
}

class _WomenContactCardState extends State<WomenContactCard> {
  @override
  Widget build(BuildContext context) {
    final type = widget.year;
    final idx = widget.index;
    final pos = widget.pos;
    List<Map<String, String>>? getCard =
        _globalVariable.getWomenCard(type, idx, pos);
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
                  String email = Uri.encodeComponent("mail@fluttercampus.com");
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
      ),
    );
  }
}
