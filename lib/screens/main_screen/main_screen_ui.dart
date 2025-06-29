// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intelligent_parking_management_with_ai/screens/main_screen/bookmark_ui.dart';
import 'package:intelligent_parking_management_with_ai/screens/main_screen/home_ui.dart';
import 'package:intelligent_parking_management_with_ai/screens/main_screen/user_ui.dart';
import 'package:intelligent_parking_management_with_ai/screens/profile_screen/profile_ui.dart';
import 'package:intelligent_parking_management_with_ai/utils/Pref_res.dart';

class MainHomeUI extends StatefulWidget {
  final int currentIndex;
  const MainHomeUI({super.key, this.currentIndex = 0});

  @override
  State<MainHomeUI> createState() => _MainHomeUIState();
}

class _MainHomeUIState extends State<MainHomeUI> {
  late int _currentIndex;
  PrefRes _prefRes = PrefRes();
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _prefRes.getIsLoggedIn().then((value) {
      setState(() {
        isSignedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List _currentShow = [
      HomeUI(),
      BookmarkUI(),
      isSignedIn ? ProfileUI() : UserUI(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          _currentShow[_currentIndex],
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.03,
            left: MediaQuery.of(context).size.width * 0.07,
            right: MediaQuery.of(context).size.width * 0.07,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.86,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                border: Border.all(color: Colors.grey),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.width * 0.03,
              ),
              child: GNav(
                duration: Duration(milliseconds: 600),
                iconSize: MediaQuery.of(context).size.width * 0.045,
                activeColor: Colors.black,
                tabBorderRadius: MediaQuery.of(context).size.width * 0.06,
                color: Colors.black,
                backgroundColor: Colors.white,
                tabBackgroundColor: Color(0xFFADA3EB),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.07,
                  vertical: MediaQuery.of(context).size.width * 0.04,
                ),
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
                      icon: _currentIndex == 2
                          ? FontAwesomeIcons.solidBookmark
                          : FontAwesomeIcons.bookmark),
                  GButton(
                      icon: _currentIndex == 3
                          ? FontAwesomeIcons.solidUser
                          : FontAwesomeIcons.user),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
