import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sac_nitp/info.dart';
import 'package:sac_nitp/utility/global_variable.dart' as globals;

globals.GlobalVariable _variable = globals.GlobalVariable();

Map<String, String> images = _variable.getImages();

class MyResCard extends StatefulWidget {
  final snap;
  const MyResCard({super.key, this.snap});
  @override
  State<MyResCard> createState() => _MyResCardState();
}

class _MyResCardState extends State<MyResCard> {
  @override
  Widget build(BuildContext context) {
    String? resultCardId = widget.snap['resultCardId'];
    String? game = widget.snap['game'];
    String? team1 = widget.snap['team1'];
    String? team2 = widget.snap['team2'];
    String? date = widget.snap['date'];
    String? time = widget.snap['time'];
    String? result = widget.snap['result'];
    String? mom = widget.snap['mom'];
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.4,
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
            '${team1!} V/S ${team2!}',
            style: GoogleFonts.titilliumWeb(
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
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
                        date!,
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
                        time!,
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
          //result
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: const Icon(
                    Icons.emoji_events_outlined,
                    size: 30,
                    color: Colors.black87,
                  ),
                ),
                Flexible(
                  child: Text(
                    result!,
                    style: GoogleFonts.barlowCondensed(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: Image.asset(
                    "lib/assets/medal.png",
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                  ),
                ),
                Flexible(
                  child: Text(
                    'Man Of The Match: ${mom!}',
                    style: GoogleFonts.barlowCondensed(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
