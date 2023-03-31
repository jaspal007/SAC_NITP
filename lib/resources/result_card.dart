import 'package:flutter/material.dart';
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.26,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(images[game]!),
          opacity: 0.1,
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        gradient: const LinearGradient(
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
            game!,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),

          //team 1 vs team2
          Text(
            '${team1!} V/S ${team2!}',
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
                        date!,
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
                        time!,
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
          //result
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.emoji_events_outlined,
                  size: 30,
                  color: Colors.black87,
                ),
                Text(
                  result!,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
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
