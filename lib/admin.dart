import 'package:flutter/material.dart';
import 'global_variable.dart' as globals;

globals.GlobalVariable _variable = globals.GlobalVariable();

List<String> teams = _variable.getTeams();
String dropDownValue1 = teams[1];
String dropDownValue2 = teams.last;

class MyAdmin extends StatefulWidget {
  const MyAdmin({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAdminState();
  }
}

class MyAdminState extends State<MyAdmin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                textAlign: TextAlign.left,
                'Admin',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: DropdownButton<String>(
                  menuMaxHeight: 150,
                  icon: const Icon(
                    Icons.sports_baseball_rounded,
                  ),
                  iconEnabledColor: Colors.green,
                  underline: Container(
                    height: 2,
                    color: Colors.green,
                  ),
                  value: dropDownValue1,
                  onChanged: (String? values) {
                    setState(() {
                      dropDownValue1 = values!;
                    });
                  },
                  items: teams.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              DropdownButton<String>(
                menuMaxHeight: 150,
                icon: const Icon(
                  Icons.sports_baseball_rounded,
                ),
                iconEnabledColor: Colors.green,
                underline: Container(
                  height: 2,
                  color: Colors.green,
                ),
                value: dropDownValue2,
                onChanged: (String? values) {
                  setState(() {
                    dropDownValue2 = values!;
                  });
                },
                items: teams.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
