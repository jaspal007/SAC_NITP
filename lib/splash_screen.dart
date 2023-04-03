// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:sac_nitp/main.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 2), () {
//       Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (_) => MyApp()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black12,
//       body: Center(
//         child: Column(
//           children: [
//             Image.asset(
//               'assets/sac_nitp.jpg',
//               scale: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
