// ignore_for_file: unused_import, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelligent_parking_management_with_ai/common/button_route.dart';
import 'package:intelligent_parking_management_with_ai/screens/sign_in_screen/sign_in_ui.dart';

class UserSubScreenUI extends StatefulWidget {
  const UserSubScreenUI({super.key});

  @override
  State<UserSubScreenUI> createState() => _UserSubScreenUIState();
}

class _UserSubScreenUIState extends State<UserSubScreenUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
              child: Container(
                child: Center(
                  child: Text(
                    'Welcome to Computer Eng. Project',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.20,
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
              child: Image.asset(
                'assets/images/iconapp.png',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.55,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Intelligent Parking\nManagement with\nArtificial Intelligent',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.73,
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
              child: ButtonrouteCommon(
                title: 'Let\'s Go!',
                route: SignInScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
