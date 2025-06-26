// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_import, unused_local_variable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intelligent_parking_management_with_ai/data/sign_up_data.dart';
import 'package:intelligent_parking_management_with_ai/data/user_data.dart';
import 'package:intelligent_parking_management_with_ai/views/main_home_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/splash_screen_ui.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/home_sub_screen_ui.dart';

void main() {
  // Get Controller Data
  UserData userData = Get.put(UserData());
  SignUpData signUpData = Get.put(SignUpData());

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
        canvasColor: Colors.white,
        tabBarTheme: const TabBarTheme(
          indicator: BoxDecoration(), // ปิด indicator
          indicatorColor: Colors.transparent,
        ),
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
        canvasColor: Colors.black,
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
