import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system_theme/system_theme.dart';
import 'home.dart';

// ignore: non_constant_identifier_names
// List<Widget> Pages = <Widget>[
//   const MyHome(),
//   const MyResHome(),
//   const AdminLogin(),
// ];

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
          selectedItemColor: Colors.white,
        ),
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 1000,
        duration: 500,
        splash: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                     CircleAvatar(
                      backgroundImage: AssetImage("lib/assets/sac_nitp.jpg"),
                      maxRadius: 80,
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "lib/assets/NITP_logo3.png",
                      cacheHeight: 100,
                      cacheWidth: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        nextScreen: const MyHome(),
        backgroundColor: (SystemTheme.isDarkMode) ? Colors.black : Colors.white,
        splashTransition: SplashTransition.scaleTransition,
      ),
    );
  }
}
