// ignore_for_file: unused_import, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkMode = false;
  int _currentIndex = 3; // ตั้งค่าเริ่มต้นให้เป็นแท็บโปรไฟล์

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // เนื้อหาหลัก
          Column(
            children: [
              // ส่วนหัวด้านบนพื้นหลังสีม่วงอ่อน
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFD8D4F2), // สีม่วงอ่อน
                ),
              ),

              // ส่วนเนื้อหาด้านล่าง
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      // พื้นที่ว่างสำหรับรูปโปรไฟล์
                      SizedBox(height: 100),

                      // ชื่อผู้ใช้
                      Text(
                        "User Name",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),

                      // สวิตช์โหมดมืด
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.nightlight_round,
                                      color: Colors.grey),
                                  SizedBox(width: 10),
                                  Text(
                                    "Drak Mode",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Switch(
                                value: isDarkMode,
                                onChanged: (value) {
                                  setState(() {
                                    isDarkMode = value;
                                  });
                                },
                                activeColor: Color(0xFFD8D4F2),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ตัวเลือกรายละเอียดโปรไฟล์
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.person, color: Colors.grey),
                              SizedBox(width: 10),
                              Text(
                                "Profile Details",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // รูปโปรไฟล์ตรงกลางระหว่างสองสีพื้นหลัง
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3 - 100,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/LGBTQ.png', // รูปตัวอย่าง
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // แถบนำทางด้านล่าง
        ],
      ),
    );
  }
}

class UserSubScreenUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfilePage();
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}
