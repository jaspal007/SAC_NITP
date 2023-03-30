import 'package:flutter/material.dart';
import './resources/card.dart';
import 'package:intl/intl.dart';
import 'global_variable.dart' as globals;

globals.GlobalVariable _variable = globals.GlobalVariable();

enum dates { yesterday, today, tommorow, custom }

dates _item = dates.today;

DateTime now = DateTime.now();
final DateFormat format = DateFormat.MMMEd();
String custom = "Today";

List<String> games = _variable.getGames();
String dropdownValue = games.first;

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<StatefulWidget> createState() => _MyHomeApp();
}

class _MyHomeApp extends State<MyHome> {
  final _key1 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final mainScreen = MediaQuery.of(context).size.height;
    final height = mainScreen - MediaQuery.of(context).padding.bottom;
    void setDate(dates date) {
      setState(() {
        if (date == dates.yesterday) {
          custom = 'Yesterday';
        } else if (date == dates.today) {
          custom = 'Today';
        } else if (date == dates.tommorow) {
          custom = 'Tommorow';
        } else if (date == dates.custom) {
          custom = format.format(now);
        }
      });
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'SAC NITP',
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: height * 0.1,
              key: _key1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        custom,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      PopupMenuButton(
                        icon: const Icon(
                          Icons.sports_basketball,
                          color: Colors.green,
                        ),
                        initialValue: _item,
                        onSelected: (dates date) {
                          return setDate(date);
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<dates>>[
                          const PopupMenuItem(
                            value: dates.yesterday,
                            child: Text('Yesterday'),
                          ),
                          const PopupMenuItem(
                            value: dates.today,
                            child: Text('Today'),
                          ),
                          const PopupMenuItem(
                            value: dates.tommorow,
                            child: Text('Tommorow'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: DateTime(2004),
                        lastDate: DateTime(2104),
                      );
                      if (newDate == null) return;
                      setState(() {
                        now = newDate;
                      });
                      setDate(dates.custom);
                    },
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                    ),
                    selectedIcon: const Icon(
                      Icons.sports_basketball,
                      color: Colors.green,
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
                    value: dropdownValue,
                    onChanged: (String? values) {
                      setState(() {
                        dropdownValue = values!;
                      });
                    },
                    items: games.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(
                height: height * 0.9,
                child: SingleChildScrollView(
                  // child: ListView.builder(
                  //   itemCount: 1,
                  //   itemBuilder: (context, index) {
                  //     return ListTile(
                  //       title: Text('Item $index'),
                  //     );
                  //   },
                  // ),
                  child: Column(
                    children: const [
                      MyCard(
                        game: "KABADDI",
                        date: "20 March '23",
                        time: "23:00",
                        team1: "CSE1",
                        team2: "CSE2",
                        venue: "Open Air Theatre",
                        remarks: "Do join us for the event",
                      ),
                      MyCard(
                        game: "KABADDI",
                        date: "20 March '23",
                        time: "23:00",
                        team1: "CSE1",
                        team2: "CSE2",
                        venue: "Open Air Theatre",
                        remarks: "Do join us for the event",
                      ),
                      MyCard(
                        game: "KABADDI",
                        date: "20 March '23",
                        time: "23:00",
                        team1: "CSE1",
                        team2: "CSE2",
                        venue: "Open Air Theatre",
                        remarks: "Do join us for the event",
                      ),
                      MyCard(
                        game: "KABADDI",
                        date: "20 March '23",
                        time: "23:00",
                        team1: "CSE1",
                        team2: "CSE2",
                        venue: "Open Air Theatre",
                        remarks: "Do join us for the event",
                      ),
                      MyCard(
                        game: "KABADDI",
                        date: "20 March '23",
                        time: "23:00",
                        team1: "CSE1",
                        team2: "CSE2",
                        venue: "Open Air Theatre",
                        remarks: "Do join us for the event",
                      ),
                      MyCard(
                        game: "KABADDI",
                        date: "20 March '23",
                        time: "23:00",
                        team1: "CSE1",
                        team2: "CSE2",
                        venue: "Open Air Theatre",
                        remarks: "Do join us for the event",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
