import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'resources/game_card.dart';
import 'package:intl/intl.dart';
import 'utility/global_variable.dart' as globals;

globals.GlobalVariable _variable = globals.GlobalVariable();

enum dates { yesterday, today, tommorow, custom }

dates _item = dates.today;

DateTime now = DateTime.now();
DateTime nowFilter = DateTime.now();
final yesFilter = nowFilter.subtract(const Duration(days: 1));
final tomFilter = nowFilter.add(const Duration(days: 1));
final DateFormat format = DateFormat.MMMEd();
String dateFilter = "Today";
DateTime dateEvent = nowFilter;

List<String> games = _variable.getGames();
String dropdownValue = games.first;

Stream setStream(String game, String date) {
  if (game == 'ALL') {
    if (date == 'Today') {
      dateEvent = nowFilter;
      return FirebaseFirestore.instance
          .collection('sportsCard')
          .where('date', isEqualTo: format.format(nowFilter))
          .snapshots();
    } else if (date == 'Yesterday') {
      dateEvent = yesFilter;
      return FirebaseFirestore.instance
          .collection('sportsCard')
          .where('date', isEqualTo: format.format(yesFilter))
          .snapshots();
    } else if (date == 'Tommorow') {
      dateEvent = tomFilter;
      return FirebaseFirestore.instance
          .collection('sportsCard')
          .where('date', isEqualTo: format.format(tomFilter))
          .snapshots();
    }
    dateEvent = now;
    return FirebaseFirestore.instance
        .collection('sportsCard')
        .where('date', isEqualTo: format.format(now))
        .snapshots();
  } else {
    if (date == 'Today') {
      dateEvent = nowFilter;
      return FirebaseFirestore.instance
          .collection('sportsCard')
          .where('game', isEqualTo: game)
          .where('date', isEqualTo: format.format(nowFilter))
          .snapshots();
    } else if (date == 'Yesterday') {
      dateEvent = yesFilter;
      return FirebaseFirestore.instance
          .collection('sportsCard')
          .where('game', isEqualTo: game)
          .where('date', isEqualTo: format.format(yesFilter))
          .snapshots();
    } else if (date == 'Tommorow') {
      dateEvent = tomFilter;
      return FirebaseFirestore.instance
          .collection('sportsCard')
          .where('game', isEqualTo: game)
          .where('date', isEqualTo: format.format(tomFilter))
          .snapshots();
    }
    dateEvent = now;
    return FirebaseFirestore.instance
        .collection('sportsCard')
        .where('game', isEqualTo: game)
        .where('date', isEqualTo: format.format(now))
        .snapshots();
  }
}

class MyGame extends StatefulWidget {
  const MyGame({super.key});
  @override
  State<StatefulWidget> createState() => _MyGameApp();
}

class _MyGameApp extends State<MyGame> {
  final _key1 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final mainScreen = MediaQuery.of(context).size.height;
    final height = mainScreen - MediaQuery.of(context).padding.bottom;
    final width = MediaQuery.of(context).size.width;
    void setDate(dates date) {
      setState(() {
        if (date == dates.yesterday) {
          dateFilter = 'Yesterday';
        } else if (date == dates.today) {
          dateFilter = 'Today';
        } else if (date == dates.tommorow) {
          dateFilter = 'Tommorow';
        } else if (date == dates.custom) {
          dateFilter = format.format(now);
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
        body: StreamBuilder(
          stream: setStream(dropdownValue, dateFilter),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: Text('No data found.'),
              );
            }

            if (snapshot.hasData) {
              var documents = snapshot.data!.docs;
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: height * 0.1,
                    key: _key1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              dateFilter,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            PopupMenuButton(
                              icon: const Icon(
                                Icons.sports_basketball,
                                color: Colors.teal,
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
                            color: Colors.teal,
                          ),
                        ),
                        Container(
                          child: DropdownButton<String>(
                            isDense: true,
                            menuMaxHeight: 150,
                            icon: const Icon(
                              Icons.sports_baseball_rounded,
                            ),
                            iconEnabledColor: Colors.teal,
                            underline: Container(
                              height: 2,
                              color: Colors.teal,
                            ),
                            value: dropdownValue,
                            onChanged: (String? values) {
                              setState(() {
                                dropdownValue = values!;
                              });
                            },
                            items: games
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        return MyCard(
                          snap: snapshot.data!.docs[index].data(),
                          dateTime: dateEvent,
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return Column(
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
                            dateFilter,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          PopupMenuButton(
                            icon: const Icon(
                              Icons.sports_basketball,
                              color: Colors.teal,
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
                          color: Colors.teal,
                        ),
                      ),
                      DropdownButton<String>(
                        menuMaxHeight: 150,
                        icon: const Icon(
                          Icons.sports_baseball_rounded,
                        ),
                        iconEnabledColor: Colors.teal,
                        underline: Container(
                          height: 2,
                          color: Colors.teal,
                        ),
                        value: dropdownValue,
                        onChanged: (String? values) {
                          setState(() {
                            dropdownValue = values!;
                          });
                        },
                        items:
                            games.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Text('No Data Found!!!'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
