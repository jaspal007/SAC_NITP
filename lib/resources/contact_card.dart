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
