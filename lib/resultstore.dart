import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class resultpage extends StatefulWidget {
  const resultpage({super.key});

  @override
  State<resultpage> createState() => _resultpageState();
}

class _resultpageState extends State<resultpage> {
  final bool expands = false;
  bool isLoading = false;
 String dropdownValue = 'Cricket';
  DateTime selectedDateTime = DateTime.now();
  final TextEditingController _descriptionController = TextEditingController();
  String r1 = "none";
  String r2 = "none";
  String wi = "none";
  String team1="None";
  String team2="None";
  String gametype="Cricket";
  DateTime time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    CollectionReference res = FirebaseFirestore.instance .collection('results');
    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return res
          .add({
            'Gametype': gametype,
            'team1':team1,
            'team2':team2,
            'winner': wi,
             'DateTime': time,
            '1st runner up': r1,
            'second runner up': r2,
            'Date':DateFormat.yMMMd().format(time),

          })
          .then((value) => print("Result Added"))
          .catchError((error) => print("Failed to add result: $error"));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Text(
              "Result Page",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue),
            ),
            padding: EdgeInsets.only(
              left: 10,
              top: 30,
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 165, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                onChanged: (value) {
                  team1 = value;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter team1',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 165, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                onChanged: (value) {
                  team2 = value;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Team2',
                ),
              ),
            ),
          ),
           Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 154, 165, 224),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Select Gametype:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(width: 20),
                  DropdownButton<String>(
                    dropdownColor: Color.fromARGB(255, 153, 153, 181),
                    value: dropdownValue,
                    items: <String>[
                      'Cricket',
                      'Football',
                      'Basketball',
                      'Badminton',
                      'WeightLifting'
                    ].map<DropdownMenuItem<String>>((String gametype) {
                      return DropdownMenuItem<String>(
                        value: gametype,
                        child: Text(
                          gametype,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value!;
                        gametype = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 165, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 130, left: 5),
                    child: Text(
                      "Enter the Date and Time below",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  DateTimeField(
                    onDateSelected: (DateTime value) {
                      setState(() {
                        selectedDateTime = value;
                        time = value;
                      });
                    },
                    selectedDate: selectedDateTime,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
         
         
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 165, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onChanged: (value) {
                  wi = value;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Winner name',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 165, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                onChanged: (value) {
                  r1 = value;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter 1st runner up',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 165, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                onChanged: (value) {
                  r2 = value;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter 2nd runner up',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                addUser();
                setState(() {
                  isLoading = true;
                });
                Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    isLoading = false;
                  });
                });
              },
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Loading...',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ],
                    )
                  : const Text('Submit'),
            ),
          ),
        ]),
      ),
    );
  }
}
