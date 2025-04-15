/* // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/viewsMembers/final_mem_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/viewsMembers/sign_in_ui.dart';

void main() {
  runApp(GenderMem());
}

class GenderMem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GenderMemScreen(),
    );
  }
}

class GenderMemScreen extends StatefulWidget {
  @override
  _GenderMemScreenState createState() => _GenderMemScreenState();
}

class _GenderMemScreenState extends State<GenderMemScreen> {
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
                    "Finally",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5), // เพิ่มช่องว่างระหว่างข้อความ
                  Text(
                    "Enter your details below to create your account",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
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
                        Text(
                          "Gender",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            genderOption("Man", "assets/images/man.png"),
                            genderOption("LGBTQ+", "assets/images/LGBTQ.png"),
                            genderOption("Woman", "assets/images/woman.png"),
                          ],
                        ),
                        SizedBox(height: 40),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FinalMemUIScreen()));
                              // เพิ่มโค้ดการล็อกอินที่นี่
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFB8A4F4), // สีม่วงอ่อน
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Submit",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),

                        

                        SizedBox(height: 20),

                        // ลิงก์ "Don't have an account? Sign up"
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? "),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInUI()));
                                  // Navigation ไปหน้าอื่น
                                },
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: Color(0xFFB8A4F4),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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

  Widget genderOption(String gender, String assetPath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(assetPath),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                gender,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              if (selectedGender == gender)
                Icon(Icons.radio_button_checked, color: Colors.purple),
              if (selectedGender != gender)
                Icon(Icons.radio_button_off, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
 */