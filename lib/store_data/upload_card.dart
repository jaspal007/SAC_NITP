import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SportsCard {
  final String cardId;
  final String game;
  final String venue;
  final String team1;
  final String team2;
  final String date;
  final String time;
  final String remarks;

  const SportsCard({
    required this.remarks,
    required this.cardId,
    required this.game,
    required this.date,
    required this.time,
    required this.venue,
    required this.team1,
    required this.team2,
  });

  Map<String, dynamic> toJson() => {
        'game': game,
        'remarks': remarks,
        'date': date,
        'time': time,
        'cardId': cardId,
        'venue': venue,
        'team1': team1,
        'team2': team2,
      };

  static SportsCard fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return SportsCard(
      game: snapshot['game'],
      remarks: snapshot['remarks'],
      cardId: snapshot['postId'],
      team1: snapshot['team1'],
      team2: snapshot['team2'],
      date: snapshot['date'],
      time: snapshot['time'],
      venue: snapshot['venue'],
    );
  }
}
