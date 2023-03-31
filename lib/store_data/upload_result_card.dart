import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultCard {
  final String resultCardId;
  final String game;
  final String team1;
  final String team2;
  final String date;
  final String time;
  final String result;

  const ResultCard({
    required this.resultCardId,
    required this.game,
    required this.team1,
    required this.team2,
    required this.date,
    required this.time,
    required this.result,
  });

  Map<String, dynamic> toJson() => {
        'resultCardId': resultCardId,
        'game': game,
        'team1': team1,
        'team2': team2,
        'date': date,
        'time': time,
        'result': result,
      };

  static ResultCard fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ResultCard(
      game: snapshot['game'],
      resultCardId: snapshot['resultCardId'],
      team1: snapshot['team1'],
      team2: snapshot['team2'],
      date: snapshot['date'],
      time: snapshot['time'],
      result: snapshot['result'],
    );
  }
}
