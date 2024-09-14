// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intelligent_parking_management_with_ai/views/home_ui.dart';
import '../check_connected.dart';

class CheckConnectedUI extends StatefulWidget {
  const CheckConnectedUI({super.key});

  @override
  State<CheckConnectedUI> createState() => _CheckConnectedUIState();
}

class _CheckConnectedUIState extends State<CheckConnectedUI> {
  final CheckConnected _checkConnected = CheckConnected();
  late StreamSubscription<bool> _connectionSubscription;
  String _connectionStatus = '0';

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  void _checkInternetConnection() async {
    _connectionSubscription =
        _checkConnected.connectionStream.listen((isConnected) {
      setState(() {
        _connectionStatus = isConnected ? "1" : "0";
      });
    });

    if (_connectionStatus == "1") {
      Future.delayed(
        Duration(
          seconds: 3,
        ),
        () => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeUI(),
            ),
          ),
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 62.93,
              left: -23,
              child: Container(
                width: 248.1,
                height: 251.25,
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x010C6CFF)
                          .withOpacity(0.7), // rgba(1, 108, 159, 0.51)
                      blurRadius: 100.0,
                      offset: Offset(0, 10),
                    ),
                  ],
                  gradient: RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1.15,
                    colors: [
                      Color(0xFFFFEE49), // #FFEE49
                      Color(0xFFF0E78F), // #F0E78F
                      Color(0xFFD2CDA0), // #D2CDA0
                      Color(0xFF002435), // #002435
                    ],
                    stops: [0.0, 0.3000, 0.7000, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 99,
              left: 9,
              child: Container(
                width: 290,
                height: 270,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..scale(-1.0, 1.0, 1.0)
                    ..rotateZ(6 * 3.1415927 / 180),
                  child: Image.asset('assets/images/redcar.png'),
                ),
              ),
            ),
            Positioned(
              top: 234,
              left: 250.58,
              child: Container(
                width: 244.72,
                height: 253.48,
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFFEB8CB4) // #EB8CB4
                          .withOpacity(0.7), // rgba(1, 108, 159, 0.51)
                      blurRadius: 100.0,
                      offset: Offset(0, 10),
                    ),
                  ],
                  gradient: RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1.0,
                    colors: [
                      Color(0xFFFFB1D2), // #FFB1D2
                      Color(0xFFE37D96), // #E37D96
                      Color(0xFFB8326A), // #B8326A
                      Color(0xFF6B2A67), // #6B2A67
                    ],
                    stops: [0.0, 0.3000, 0.7000, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 220,
              left: 179,
              child: Container(
                width: 290,
                height: 270,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateZ(0 * 3.1415927 / 180),
                  child: Image.asset('assets/images/silvercar.png'),
                ),
              ),
            ),
            Positioned(
              bottom: 250,
              left: 20,
              child: ShaderMask(
                shaderCallback: (bounds) => RadialGradient(
                  center: Alignment(-0.2, -2.8),
                  radius: 2.5,
                  colors: [
                    Color(0xFFADA3EB), // #ADA3EB
                    Color(0xFFADA3EB), // #ADA3EB
                    Color(0xFFCF84CA), // #CF84CA
                    Color(0xFFCF84CA), // #CF84CA
                  ],
                  stops: [0.0, 0.6, 0.8, 1.0],
                ).createShader(bounds),
                child: Text(
                  'Intelligent Parking \nManagement with AI',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
