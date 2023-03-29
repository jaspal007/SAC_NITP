import 'package:flutter/material.dart';
import 'package:sac_nitp/resultshow.dart';
import 'package:sac_nitp/search.dart';
import 'package:sac_nitp/searchbydate.dart';
import './resources/card.dart';
import 'package:intl/intl.dart';
import 'global_variable.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';

globals.GlobalVariable _variable = globals.GlobalVariable();

enum dates { today, custom }

dates _item = dates.today;
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
  final _key2 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now(); //.subtract(const Duration(days: 1));
    final DateFormat format = DateFormat.yMMMd('en_US');
    String formatted = format.format(now);
    final mainScreen = MediaQuery.of(context).size.height;
    final height = mainScreen - MediaQuery.of(context).padding.bottom;
    DateTime time = DateTime.now();
    void setDate(dates date) {
      setState(() {
        if (date == dates.today) {
          custom = 'Today';
        } else if (date == dates.custom) {
          custom = formatted;
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
                            value: dates.today,
                            child: Text('Today'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      icon: const Icon(
                        Icons.calendar_today,
                      ),
                      onPressed: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const FirebaseSearchScreen()));
                      })),
                  IconButton(
                      icon: const Icon(
                        Icons.search,
                      ),
                      onPressed: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const FirebaseSearchScreen2()));
                      })),
                  IconButton(
                      icon: const Icon(
                        Icons.scoreboard_outlined,
                        color: Color.fromARGB(255, 105, 170, 220),
                        size: 30,
                      ),
                      onPressed: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const resultshow()));
                      }))
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(
                height: height * 0.9,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('posts')
                        .where('Date',
                            isEqualTo: DateFormat.yMMMd().format(time))
                        .snapshots(),
                    builder: ((context, Mydata) {
                      if (Mydata.hasData) {
                        var documents = Mydata.data!.docs;
                        print(documents);
                        return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: ((context, index) => Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.40,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("lib/assets/space.jpg"),
                                    opacity: 0.2,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white10,
                                      Colors.white30,
                                      Colors.white70,
                                      Colors.white,
                                    ],
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Game :" +
                                          '${documents[index]['Gametype']}',
                                      style: TextStyle(fontSize: 23),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Team1:" +
                                              '${documents[index]['Team1']}' +
                                              "  V/S  " +
                                              "Team2:"
                                                  '${documents[index]['Team2']}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          size: 20,
                                          color: Colors.black87,
                                        ),
                                        Text(
                                          "venue :"
                                          '${documents[index]['venue']}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_today_rounded,
                                          size: 20,
                                          color: Colors.black87,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          '${((documents[index]['DateTime']).toDate()).toString()}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Description :"
                                      '${documents[index]['Description']}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              )),
                        );
                      }
                      return CircularProgressIndicator();
                    })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
