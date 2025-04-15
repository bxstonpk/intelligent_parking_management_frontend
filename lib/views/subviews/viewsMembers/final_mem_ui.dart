/* // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:intelligent_parking_management_with_ai/views/main_home_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/user_sub_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/viewsMembers/sign_in_ui.dart';

void main() {
  runApp(FinalMemUI());
}

class FinalMemUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FinalMemUIScreen(),
    );
  }
}

class FinalMemUIScreen extends StatefulWidget {
  @override
  _FinalMemUIScreenState createState() => _FinalMemUIScreenState();
}

class _FinalMemUIScreenState extends State<FinalMemUIScreen> {
  String selectedGender = "Man";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 232),
      appBar: AppBar(
        backgroundColor: Color(0xFFADA3EB), // สีม่วงอ่อน
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left_outlined),
          iconSize: 50,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context); // ไปหน้าก่อนหน้า
          },
        ),
      ),
      body: Stack(
        children: [
          // พื้นหลังสีม่วง
          Container(
            height: MediaQuery.of(context).size.height * 0.35, // 40% ของหน้าจอ
            decoration: BoxDecoration(
              color: Color(0xFFADA3EB),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Thank you",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5), // เพิ่มช่องว่างระหว่างข้อความ
                ],
              ),
            ),
          ),

          // วางเนื้อหาให้อยู่ตรงกลาง
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 240), // ระยะห่างจากบนสุด

                // ฟอร์มล็อกอิน
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.black26, width: 1), // กรอบดำจางๆ
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/checkMem.png",
                              width: 150,
                            )
                          ],
                        ),
                        SizedBox(height: 25),

                        Center(
                          child: Text(
                            "Registration Completed!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SignInUI()));
                              // เพิ่มโค้ดการล็อกอินที่นี่
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFB8A4F4), // สีม่วงอ่อน
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Continue",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        // ลิงก์ "Don't have an account? Sign up"
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  
}
 */