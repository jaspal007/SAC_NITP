import 'package:cloud_firestore/cloud_firestore.dart';

class Admin {
  final String email;
  final String password;

  const Admin({
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
  static Admin fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Admin(
     
      email: snapshot['email'],
      password: snapshot['password'],
   
    );
  }
}
