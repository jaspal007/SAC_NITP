import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sac_nitp/home.dart';
import 'package:sac_nitp/utility/snackbar.dart';
import 'package:sac_nitp/utility/text_input.dart';
import 'package:uuid/uuid.dart';
import 'firebase/firestore_methods.dart';
import 'main.dart';
import 'utility/global_variable.dart' as globals;

globals.GlobalVariable _variable = globals.GlobalVariable();

List<String> games = _variable.getGames();
List<String> teams = _variable.getTeams();

String? dropDownValue1;
String? dropDownValue2;
String? dropDownValue3;

DateTime dateTime = DateTime.now();
final DateFormat formatDate = DateFormat.MMMEd();
String date = formatDate.format(dateTime);
TimeOfDay timeOfDay = TimeOfDay.now();

class MyResult extends StatefulWidget {
  const MyResult({super.key});

  @override
  State<StatefulWidget> createState() => _MyResultState();
}

class _MyResultState extends State<MyResult> {
  final TextEditingController _result = TextEditingController();
  final TextEditingController _game = TextEditingController();
  final TextEditingController _team1 = TextEditingController();
  final TextEditingController _team2 = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();

  void clearFields() {
    setState(() {
      dropDownValue1 = null;
      dropDownValue2 = null;
      dropDownValue3 = null;
      date = format.format(DateTime.now());
      _result.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainScreen = MediaQuery.of(context).size.height;
    final height = mainScreen - MediaQuery.of(context).padding.bottom;
    final hour = (timeOfDay.period == DayPeriod.am)
        ? timeOfDay.hour
        : timeOfDay.hour - 12;
    final minutes = timeOfDay.minute;
    final periodOfDay = (timeOfDay.period == DayPeriod.am) ? 'AM' : 'PM';
    final time =
        '${hour.toString().padLeft(2, '0')} : ${minutes.toString().padLeft(2, '0')} $periodOfDay';
    void setDate(DateTime now) {
      setState(() {
        date = formatDate.format(now);
      });
    }

    bool _isLoading = false;

    void uploadResult() async {
      setState(() {
        _isLoading = true;
      });
      String res = 'success';

      if (res == 'success') {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MyHome()));
      } else {
        showSnackBar(res, context);
      }
      setState(() {
        _isLoading = false;
      });
    }

    String resultCardId = const Uuid().v1();
    void postResultCard() async {
      setState(() {
        _isLoading = true;
      });
      try {
        String res = await FirestoreMethods().uploadResultCard(
          resultCardId,
          dropDownValue1!,
          dropDownValue2!,
          dropDownValue3!,
          date,
          time,
          _result.text,
        );

        if (res == "success") {
          setState(() {
            _isLoading = true;
          });
          showSnackBar('posted', context);
          clearFields();
        } else {
          setState(() {
            _isLoading = true;
          });
          showSnackBar(res, context);
        }
      } catch (e) {
        showSnackBar(e.toString(), context);
      }
    }

    @override
    void dispose() {
      super.dispose();
      _game.dispose();
      _team1.dispose();
      _team2.dispose();
      _date.dispose();
      _time.dispose();
      _result.dispose();
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: const Text(
                  textAlign: TextAlign.left,
                  'Admin',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //Game
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  dropdownMaxHeight: 150,
                  icon: const Icon(
                    Icons.sports_baseball_rounded,
                  ),
                  iconEnabledColor: Colors.teal,
                  hint: const Text('Game'),
                  items: games
                      .map(
                        (game) => DropdownMenuItem<String>(
                          value: game,
                          child: Text(
                            game,
                          ),
                        ),
                      )
                      .toList(),
                  value: dropDownValue1,
                  onChanged: (String? value) {
                    setState(() {
                      dropDownValue1 = value!;
                    });
                  },
                ),
              ),
              //Team 1
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  dropdownMaxHeight: 150,
                  icon: const Icon(
                    Icons.sports_baseball_rounded,
                  ),
                  iconEnabledColor: Colors.teal,
                  hint: const Text(
                    'Select Team 1',
                  ),
                  items: teams
                      .map(
                        (team) => DropdownMenuItem<String>(
                          value: team,
                          child: Text(
                            team,
                          ),
                        ),
                      )
                      .toList(),
                  value: dropDownValue2,
                  onChanged: (String? value) {
                    setState(() {
                      dropDownValue2 = value!;
                    });
                  },
                ),
              ),
              //Team 2
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  dropdownMaxHeight: 150,
                  icon: const Icon(
                    Icons.sports_baseball_rounded,
                  ),
                  iconEnabledColor: Colors.teal,
                  hint: const Text(
                    'Select Team 2',
                  ),
                  items: teams
                      .map(
                        (team) => DropdownMenuItem<String>(
                          value: team,
                          child: Text(
                            team,
                          ),
                        ),
                      )
                      .toList(),
                  value: dropDownValue3,
                  onChanged: (String? value) {
                    setState(() {
                      dropDownValue3 = value!;
                    });
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        date,
                      ),
                      IconButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: dateTime,
                            firstDate: DateTime(2004),
                            lastDate: DateTime(2104),
                          );
                          if (newDate == null) return;
                          setState(() {
                            dateTime = newDate;
                          });
                          setDate(dateTime);
                        },
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        time,
                      ),
                      IconButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (newTime == null) return;
                          setState(() {
                            timeOfDay = newTime;
                          });
                        },
                        icon: const Icon(
                          Icons.access_time_outlined,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TextFieldInput(
                textEditingController: _result,
                labelText: 'Result',
                textInputType: TextInputType.text,
              ),
              ElevatedButton(
                onPressed: () {
                  if (dropDownValue1!.isNotEmpty &&
                      dropDownValue2!.isNotEmpty &&
                      dropDownValue3!.isNotEmpty &&
                      date.isNotEmpty &&
                      time.isNotEmpty &&
                      _result.text.isNotEmpty) {
                    postResultCard();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data Entry Error!'),
                      ),
                    );
                  }
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.teal),
                ),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ),
                  );
                },
                child: const Text(
                  'LOGOUT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
