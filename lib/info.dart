import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  final String game;
  final String team1;
  final String team2;
  final String date;
  final String time;
  final String venue;
  final String remarks;

  const MyInfo({
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
    final height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.bottom;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.black45,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: width,
                child: Image.asset(
                  "lib/assets/intramural_banner.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //name of the game
                  Text(
                    game,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),

                  //team 1 vs team2
                  Text(
                    '$team1 V/S $team2',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 2.5,
                          left: 5,
                          right: 2.5,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                            Text(
                              ' $date',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 2.5,
                          left: 2.5,
                          right: 5,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 15,
                            ),
                            Text(
                              ' $time',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //venue
                  Container(
                    padding: const EdgeInsets.only(
                      top: 2.5,
                      bottom: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(
                          venue,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
