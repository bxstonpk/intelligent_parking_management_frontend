// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/bookmark_sub_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/home_sub_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/like_sub_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/notify_sub_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/user_sub_screen_ui.dart';

class MainHomeUI extends StatefulWidget {
  const MainHomeUI({super.key});

  @override
  State<MainHomeUI> createState() => _MainHomeUIState();
}

class _MainHomeUIState extends State<MainHomeUI> {
  int _currentIndex = 0;
  List _currentShow = [
    HomeSubScreenUI(),
    LikeSubScreenUI(),
    BookmarkSubScreenUI(),
    UserSubScreenUI(),
  ];

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
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xFF353333), // #353333
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications,
                    color: Color(0xFFFFFFFF), // #FFFFFF
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 35,
            child: Container(
              child: Text(
                'Intelligent Parking...',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
