// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelligent_parking_management_with_ai/main.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/bookmark_sub_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/home_sub_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/like_sub_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/user_sub_screen_ui.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
          _currentShow[_currentIndex],
          Positioned(
            bottom: 35, // Adjust this for height above the screen edge
            left: 30, // Adjust to center the navbar horizontally
            right: 30, // Adjust to center the navbar horizontally
            child: Container(
              width: 280,
              decoration: BoxDecoration(
                color: Environment.buttonColor(context),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                border: Border.all(
                  color: Environment.shadowColor(context),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: GNav(
                duration: Duration(milliseconds: 600),
                iconSize: 20,
                activeColor: Environment.activeColor(context),
                tabBorderRadius: 40,
                color: Environment.activeColor(context),
                backgroundColor: Environment.buttonColor(context),
                tabBackgroundColor: Color(0xFFADA3EB), // #ADA3EB
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                selectedIndex: _currentIndex,
                onTabChange: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                tabs: [
                  GButton(
                    icon: FontAwesomeIcons.house,
                  ),
                  GButton(
                    icon: _currentIndex == 1
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                  ),
                  GButton(
                    icon: _currentIndex == 2
                        ? FontAwesomeIcons.solidBookmark
                        : FontAwesomeIcons.bookmark,
                  ),
                  GButton(
                    icon: _currentIndex == 3
                        ? FontAwesomeIcons.solidUser
                        : FontAwesomeIcons.user,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
