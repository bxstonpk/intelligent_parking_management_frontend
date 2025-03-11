// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/viewsMembers/sign_up_ui.dart';

void main() {
  runApp(SignInUI());
}

class SignInUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

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
                    "Sign in to your \nAccount",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5), // เพิ่มช่องว่างระหว่างข้อความ
                  Text(
                    "Enter your email and password to login",
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
                          "Log in",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),

                        // ช่องกรอก Email
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                                color:
                                    const Color.fromARGB(255, 159, 157, 157)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // ช่องกรอก Password
                        TextField(
                          controller: passwordController,
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color:
                                    const Color.fromARGB(255, 159, 157, 157)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 45), // เพิ่มช่องว่าง

                        // ปุ่ม Sign In
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // เพิ่มโค้ดการล็อกอินที่นี่
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFB8A4F4), // สีม่วงอ่อน
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Sign in",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),

                        SizedBox(height: 5),

                        // ลิงก์ "Forget Password?"
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                        ),
                        SizedBox(height: 70),

                        // ลิงก์ "Don't have an account? Sign up"
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account? "),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpScreen()));
                                  // Navigation ไปหน้าอื่น
                                },
                                child: Text(
                                  "Sign up",
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
}
