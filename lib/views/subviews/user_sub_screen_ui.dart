// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/viewsMembers/sign_in_ui.dart';

class UserSubScreenUI extends StatefulWidget {
  const UserSubScreenUI({super.key});

  @override
  State<UserSubScreenUI> createState() => _UserSubScreenUIState();
}

class _UserSubScreenUIState extends State<UserSubScreenUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to Computer Eng. Project',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // ไม่มีเงาใต้ AppBar
        centerTitle: true, // จัดกึ่งกลางชื่อ
        toolbarHeight: 100, // กำหนดความสูงของ AppBar (สามารถปรับได้ตามต้องการ)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/iconapp.png',
              width: MediaQuery.of(context).size.width *
                  0.8, // ปรับขนาดรูป 90% ของหน้าจอ
            ),
            SizedBox(height: 20),
            Text(
              'Intelligent Parking Management with\nArtificial Intelligent',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
                // Navigation ไปหน้าอื่น
              },
              child: Text(
                "Let's Go!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFADA3EB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
