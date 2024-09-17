// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intelligent_parking_management_with_ai/views/splash_screen_ui.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        textTheme: GoogleFonts.k2dTextTheme(
          ThemeData.light().textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.black,
              ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.k2dTextTheme(
          ThemeData.dark().textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
      ),
      home: SplashScreenUI(),
    );
  }
}

class Environment {
  static Color buttonColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Color(0xFFE8E8E8) // #E8E8E8
        : Color(0xFF131313); // #131313
  }

  static Color shadowColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Color(0xFFC4C4C4) // #C4C4C4
        : Color(0xFF353333); // #353333
  }

  static Color activeColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Color(0xFF353333) // #353333
        : Color(0xFFE8E8E8); // #E8E8E8
  }
}
