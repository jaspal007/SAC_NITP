import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sac_nitp/admin_login.dart';
import 'package:sac_nitp/result_page.dart';
import 'home.dart';

// ignore: non_constant_identifier_names
List<Widget> Pages = <Widget>[
  const MyHome(),
  const MyResHome(),
  const AdminLogin(),
];

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black87,
    selectedItemColor: Colors.teal,
  ),
  primarySwatch: Colors.teal,
  textTheme: GoogleFonts.quicksandTextTheme(
    const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);
int _currentIndex = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.teal,
          selectedItemColor: Colors.amber,
        ),
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        body: Pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          //fixedColor: Colors.pink,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'IntraMurals',
              icon: Icon(
                Icons.sports_cricket_outlined,
                color: Colors.red,
              ),
              activeIcon: Icon(
                Icons.sports_cricket_rounded,
                color: Colors.red,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Results',
              icon: Icon(
                Icons.star_border_outlined,
                color: Colors.amber,
              ),
              activeIcon: Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Admin',
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.indigo,
              ),
              activeIcon: Icon(
                Icons.account_circle_sharp,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
