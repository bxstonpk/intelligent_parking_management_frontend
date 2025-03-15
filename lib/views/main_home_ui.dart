import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/bookmark_sub_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/home_sub_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/like_sub_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/ProfilePage.dart'
    as profile;
import 'package:intelligent_parking_management_with_ai/views/subviews/user_sub_screen_ui.dart'
    as user;

class MainHomeUI extends StatefulWidget {
  final bool isSignedIn; // เพิ่มตัวแปรเช็คการล็อกอิน
  const MainHomeUI({super.key, this.isSignedIn = false});

  @override
  State<MainHomeUI> createState() => _MainHomeUIState();
}

class _MainHomeUIState extends State<MainHomeUI> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List _currentShow = [
      HomeSubScreenUI(),
      LikeSubScreenUI(),
      BookmarkSubScreenUI(),
      widget.isSignedIn
          ? profile.ProfilePage()
          : user.UserSubScreenUI(), // เปลี่ยนเป็น ProfilePage ถ้า Sign In
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
                  GButton(icon: FontAwesomeIcons.house),
                  GButton(
                      icon: _currentIndex == 1
                          ? FontAwesomeIcons.solidHeart
                          : FontAwesomeIcons.heart),
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
