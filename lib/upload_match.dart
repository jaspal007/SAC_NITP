import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sac_nitp/intramurals.dart';
import 'package:sac_nitp/main.dart';
import 'package:sac_nitp/utility/snackbar.dart';
import 'package:sac_nitp/utility/text_input.dart';
import 'package:uuid/uuid.dart';
import 'firebase/firestore_methods.dart';
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

class MyAdmin extends StatefulWidget {
  const MyAdmin({super.key});

  @override
  State<StatefulWidget> createState() => _MyAdminState();
}

class _MyAdminState extends State<MyAdmin> {
  final TextEditingController _venue = TextEditingController();
  final TextEditingController _game = TextEditingController();
  final TextEditingController _team1 = TextEditingController();
  final TextEditingController _team2 = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _remarks = TextEditingController();
  bool _isLoading = false;

  late OverlayEntry entry;

  void clearFields() {
    setState(() {
      dropDownValue1 = null;
      dropDownValue2 = null;
      dropDownValue3 = null;
      date = format.format(DateTime.now());
      _venue.clear();
      _remarks.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final hour = (timeOfDay.period == DayPeriod.am)
        ? timeOfDay.hour
        : timeOfDay.hour - 12;
    final minutes = timeOfDay.minute;
    final periodOfDay = (timeOfDay.period == DayPeriod.am) ? 'AM' : 'PM';
    final time =
        '${hour.toString().padLeft(2, '0')} : ${minutes.toString().padLeft(2, '0')} $periodOfDay';
    final mainScreen = MediaQuery.of(context).size.height;
    final height = mainScreen - MediaQuery.of(context).padding.bottom;
    void setDate(DateTime now) {
      setState(() {
        date = formatDate.format(now);
      });
    }

    void uploadEvent() async {
      setState(() {
        _isLoading = true;
      });
      String res = 'success';

      if (res == 'success') {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MyGame()));
      } else {
        showSnackBar(res, context);
      }
      setState(() {
        _isLoading = false;
      });
    }

    String cardId = const Uuid().v1();
    void postCard() async {
      setState(() {
        _isLoading = true;
      });
      try {
        String res = await FirestoreMethods().uploadSportsCard(
          cardId,
          dropDownValue1!,
          dropDownValue2!,
          dropDownValue3!,
          date,
          time,
          _venue.text,
          _remarks.text = (_remarks.text.isEmpty) ? 'Welcome' : _remarks.text,
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
      _venue.dispose();
      _game.dispose();
      _team1.dispose();
      _team2.dispose();
      _date.dispose();
      _time.dispose();
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height * 0.8,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DropdownButtonHideUnderline(
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
                ),
                //Team 1
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DropdownButtonHideUnderline(
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
                ),
                //Team 2
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DropdownButtonHideUnderline(
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
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
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
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFieldInput(
                    textEditingController: _venue,
                    labelText: 'Venue',
                    textInputType: TextInputType.text,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFieldInput(
                    textEditingController: _remarks,
                    labelText: 'Remarks',
                    textInputType: TextInputType.text,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (dropDownValue1!.isNotEmpty &&
                              dropDownValue2!.isNotEmpty &&
                              dropDownValue3!.isNotEmpty &&
                              date.isNotEmpty &&
                              time.isNotEmpty &&
                              _venue.text.isNotEmpty) {
                            postCard();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Data Entry Error!'),
                              ),
                            );
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.teal),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
