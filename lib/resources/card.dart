import 'package:flutter/material.dart';

import 'package:sac_nitp/info.dart';

class MyCard extends StatelessWidget {
  final String game;
  final String team1;
  final String team2;
  final String date;
  final String time;
  final String venue;
  final String remarks;

  const MyCard({
    Key? key,
    required this.game,
    required this.team1,
    required this.team2,
    required this.date,
    required this.time,
    required this.venue,
    required this.remarks,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyInfo(
              game: "KABADDI",
              date: "20 March '23",
              time: "23:00",
              team1: "CSE1",
              team2: "CSE2",
              venue: "Open Air Theatre",
              remarks: "Do join us for the event",
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.26,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //name of the game
            Text(
              game,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),

            //team 1 vs team2
            Text(
              '$team1 V/S $team2',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      right: 5,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.black87,
                          size: 15,
                        ),
                        Text(
                          ' $date',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 5,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.black87,
                          size: 15,
                        ),
                        Text(
                          ' $time',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //venue
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 15,
                    color: Colors.black87,
                  ),
                  Text(
                    venue,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
