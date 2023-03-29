import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';

class resultshow extends StatefulWidget {
  const resultshow({super.key});

  @override
  State<resultshow> createState() => _resultshowState();
}

class _resultshowState extends State<resultshow> {
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("Result of Matches"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('results')
              .orderBy("DateTime",descending:true)
              .snapshots(),
          builder: ((context, Mydata) {
            if (Mydata.hasData) {
              var documents = Mydata.data!.docs;
              print(documents);
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: ((context, index) => Container(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Game :" + '${documents[index]['Gametype']}',
                            style: TextStyle(fontSize: 23),
                          ),
                          Text(
                              "Team1:" +
                                  '${documents[index]['team1']}' +
                                  "  V/S  " +
                                  "Team2:"
                                      '${documents[index]['team2']}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          Text(
                            "Winner :" + '${documents[index]['winner']}',
                            style: TextStyle(fontSize: 24,color: Colors.black87),
                          ),
                          Text(
                            "1st runner up :"
                            '${documents[index]['1st runner up']}',
                            style: TextStyle(fontSize: 22,color: Colors.black45),
                          ),
                          Text(
                            "2nd runner up :"
                            '${documents[index]['second runner up']}',
                            style: TextStyle(fontSize: 20,color: Colors.black45),
                          ),
                          Text(
                            "Date :" + '${documents[index]['Date']}',
                            style: TextStyle(fontSize: 20,color: Colors.black45),
                          ),
                        ],
                      ),
                    )),
              );
            }
            return CircularProgressIndicator();
          })),
    );
  }
}
