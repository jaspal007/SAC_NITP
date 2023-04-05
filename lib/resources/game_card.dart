import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sac_nitp/upload_match.dart';
import 'package:sac_nitp/info.dart';
import 'package:sac_nitp/utility/global_variable.dart' as globals;

globals.GlobalVariable _variable = globals.GlobalVariable();

Map<String, String> images = _variable.getImages();

class MyCard extends StatefulWidget {
  final snap;
  final DateTime dateTime;

  const MyCard({super.key, this.snap, required this.dateTime});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  // final String cardId;
  @override
  Widget build(BuildContext context) {
    String? cardId = widget.snap['postId'];
    String? game = widget.snap['game'];
    String? team1 = widget.snap['team1'];
    String? team2 = widget.snap['team2'];
    String? date = widget.snap['date'];
    String? time = widget.snap['time'];
    String? venue = widget.snap['venue'];
    String? remarks = widget.snap['remarks'];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyInfo(
              game: game,
              date: date!,
              time: time!,
              team1: team1,
              team2: team2,
              venue: venue,
              remarks: remarks!,
              dateTime: dateTime,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.26,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(images[game]!),
            opacity: 0.4,
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          gradient: const LinearGradient(
            colors: [
              Colors.white10,
              Colors.white10,
              Colors.white10,
              Colors.white30,
              Colors.white70,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //name of the game
            Text(
              game!,
              style: GoogleFonts.kanit(
                textStyle: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),

            //team 1 vs team2
            Text(
              '${team1!} v/s ${team2!}',
              style: GoogleFonts.titilliumWeb(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.black87,
                          size: 20,
                        ),
                        Text(
                          ' $date',
                          style: GoogleFonts.rajdhani(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.black87,
                          size: 20,
                        ),
                        Text(
                          ' $time',
                          style: GoogleFonts.rajdhani(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
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
                    size: 30,
                    color: Colors.black87,
                  ),
                  Text(
                    venue!,
                    style: GoogleFonts.barlowCondensed(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
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
