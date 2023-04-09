import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    String mob = '${getCard?[2]['Mob']}';
    String email = '${getCard?[3]['email']}';
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
                  Clipboard.setData(ClipboardData(text: mob)).then(
                    (_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Contact copied to clipboard"),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  mob,
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
                  Clipboard.setData(ClipboardData(text: email)).then(
                    (_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Email address copied to clipboard"),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  email,
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
