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
  final String mom;

  const ResultCard({
    required this.resultCardId,
    required this.game,
    required this.team1,
    required this.team2,
    required this.date,
    required this.time,
    required this.result,
    required this.mom,
  });

  Map<String, dynamic> toJson() => {
        'resultCardId': resultCardId,
        'game': game,
        'team1': team1,
        'team2': team2,
        'date': date,
        'time': time,
        'result': result,
        'mom': mom,
      };

  static ResultCard fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ResultCard(
      resultCardId: snapshot['resultCardId'],
      game: snapshot['game'],
      team1: snapshot['team1'],
      team2: snapshot['team2'],
      date: snapshot['date'],
      time: snapshot['time'],
      result: snapshot['result'],
      mom: snapshot['mom']
    );
  }
}
