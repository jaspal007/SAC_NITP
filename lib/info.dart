import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInfo extends StatelessWidget {
  final String game;
  final String team1;
  final String team2;
  final String date;
  final String time;
  final String venue;
  final String remarks;
  final DateTime dateTime;

  const MyInfo({
    Key? key,
    required this.game,
    required this.team1,
    required this.team2,
    required this.date,
    required this.time,
    required this.venue,
    required this.remarks,
    required this.dateTime,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Event event = Event(
      title: game,
      description: '$team1 v/s $team2',
      location: venue,
      startDate: dateTime,
      endDate: dateTime,
      allDay: false,
    );
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.bottom;
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
          ),
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: width,
                child: Image.asset(
                  "lib/assets/intramural_banner.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: height - 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //name of the game
                    Text(
                      game,
                      style: GoogleFonts.kanit(
                        textStyle: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    //team 1 vs team2
                    Text(
                      '$team1 v/s $team2',
                      style: GoogleFonts.titilliumWeb(
                        textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                size: 25,
                              ),
                              Text(
                                ' $date',
                                style: GoogleFonts.rajdhani(
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
                                  ),
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
                                size: 25,
                              ),
                              Text(
                                ' $time',
                                style: GoogleFonts.rajdhani(
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
                                  ),
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
                            size: 30,
                          ),
                          Text(
                            venue,
                            style: GoogleFonts.barlowCondensed(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      remarks,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Add2Calendar.addEvent2Cal(event);
        //   },
        //   backgroundColor: Colors.teal,
        //   child: const Icon(Icons.calendar_today),
        // ),
      ),
    );
  }
}
