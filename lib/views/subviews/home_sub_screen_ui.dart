// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intelligent_parking_management_with_ai/main.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/notify_sub_screen_ui.dart';
import 'package:get/get.dart';

class HomeSubScreenUI extends StatefulWidget {
  const HomeSubScreenUI({super.key});

  @override
  State<HomeSubScreenUI> createState() => _HomeSubScreenUIState();
}

class _HomeSubScreenUIState extends State<HomeSubScreenUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 60,
            right: 35,
            child: GestureDetector(
              onTap: () {
                Get.to(
                  NotifySubScreenUI(),
                );
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Environment.buttonColor(context),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Environment.shadowColor(context),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications,
                    color: Environment.activeColor(context),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 30,
            child: Container(
              child: Text(
                'Intelligent Parking...',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 30,
            child: Text(
              'Find Your \nParking Space',
              style: TextStyle(
                fontSize: 48.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
