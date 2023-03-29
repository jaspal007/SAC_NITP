import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FirebaseSearchScreen extends StatefulWidget {
  const FirebaseSearchScreen({Key? key}) : super(key: key);

  @override
  State<FirebaseSearchScreen> createState() => _FirebaseSearchScreenState();
}

class _FirebaseSearchScreenState extends State<FirebaseSearchScreen> {
  List searchResult = [];
  DateTime selectedDateTime = DateTime.now();
  DateTime time = DateTime.now();
  final DateFormat format = DateFormat.yMMMd('en_US');
  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('posts')
        .where('Date', isEqualTo: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search for Games datewise"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 50, left: 5),
            child: Row(
              children: [
                Text(
                  "Enter the Date and Time below",
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          DateTimeField(
            mode: DateTimeFieldPickerMode.date,
            use24hFormat: false,
            onDateSelected: (DateTime value) {
              setState(() {
                selectedDateTime = value;
                time = value;
                searchFromFirebase(DateFormat.yMMMd().format(time));
              });
            },
            selectedDate: selectedDateTime,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.40,
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
                  child: ListTile(
                    title: Text("Game :" + searchResult[index]['Gametype']),
                    subtitle: //Text(searchResult[index]['Team1']),
                        Column(
                      children: [
                        // Text(searchResult[index]['Gametype']),
                        
                            Text(
                              "Team1:" +
                                  '${searchResult[index]['Team1']}' +
                                  "  V/S  " +
                                  "Team2:"
                                      '${searchResult[index]['Team2']}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          
                        Text(
                            "Time : " +
                                ((searchResult[index]['DateTime']).toDate())
                                    .toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                color: Colors.black87)),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 20,
                              color: Colors.black87,
                            ),
                            Text("Venue :" + searchResult[index]['venue'],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black87)),
                          ],
                        ),
                        Text(
                            "Description :" +
                                searchResult[index]['Description'],
                            style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Colors.black87)),
                      ],
                    ),
                  ),
                );
                 
              },
            ),
          ),
        ],
      ),
    );
  }
}
