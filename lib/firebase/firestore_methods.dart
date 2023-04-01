import 'package:cloud_firestore/cloud_firestore.dart';
import '../store_data/upload_card.dart';
import '../store_data/upload_result_card.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadSportsCard(
    String cardId,
    String game,
    String team1,
    String team2,
    String date,
    String time,
    String venue,
    String remarks,
  ) async {
    String res = "Some error occurred";
    try {
      String cardId = const Uuid().v1(); // creates unique id based on time
      SportsCard card = SportsCard(
        remarks: remarks,
        cardId: cardId,
        game: game,
        venue: venue,
        team1: team1,
        team2: team2,
        date: date,
        time: time,
      );
      _firestore.collection('sportsCard').doc(cardId).set(
            card.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> uploadResultCard(
    // String description,
    String resultCardId,
    String game,
    String team1,
    String team2,
    String date,
    String time,
    String result,
  ) async {
    String res = "Some error occurred";
    try {
      String resultCardId =
          const Uuid().v1(); // creates unique id based on time
      ResultCard resultCard = ResultCard(
        resultCardId: resultCardId,
        game: game,
        team1: team1,
        team2: team2,
        date: date,
        time: time,
        result: result,
      );
      _firestore.collection('resultCard').doc(resultCardId).set(
            resultCard.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
