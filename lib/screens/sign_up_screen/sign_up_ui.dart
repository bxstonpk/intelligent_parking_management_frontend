// ignore_for_file: prefer_const_constructors, dead_code, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/common/back_button.dart';
import 'package:intelligent_parking_management_with_ai/common/button_api.dart';
import 'package:intelligent_parking_management_with_ai/common/text_field.dart';
import 'package:intelligent_parking_management_with_ai/data/sign_up_data.dart';
import 'package:intelligent_parking_management_with_ai/screens/sign_in_screen/sign_in_ui.dart';
import 'package:intelligent_parking_management_with_ai/screens/sign_up_screen/information.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class SignUpUI extends StatefulWidget {
  const SignUpUI({super.key});

  @override
  State<SignUpUI> createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {
  SignUpData signUpData = Get.find();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;

  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isConfirmPasswordVisible = true;
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: ColorRes.primaryColor,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.50,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50,
              decoration: BoxDecoration(
                color: ColorRes.greyColor,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.07,
            left: MediaQuery.of(context).size.width * 0.05,
            child: BackButtonCommon(),
          ),
          // พื้นหลังสีม่วง
          Container(
            height: MediaQuery.of(context).size.height * 0.35, // 40% ของหน้าจอ
            decoration: BoxDecoration(
              color: ColorRes.primaryColor,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create your Account",
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

          Positioned(
            top: MediaQuery.of(context).size.height * 0.27,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Sign Up",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFieldCommon(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFieldCommon(
                    controller: passwordController,
                    hintText: 'Password',
                    password: true,
                    isPassword: isPasswordVisible,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFieldCommon(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    password: true,
                    isPassword: isConfirmPasswordVisible,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        if (emailController.text.isEmpty) {
                          if (!Get.isSnackbarOpen) {
                            Get.snackbar(
                              'WARNING',
                              'Please enter your email',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              duration: Duration(
                                milliseconds: 1000,
                              ),
                            );
                          }
                        } else if (passwordController.text.isEmpty) {
                          if (!Get.isSnackbarOpen) {
                            Get.snackbar(
                              'WARNING',
                              'Please enter your password',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              duration: Duration(
                                milliseconds: 1000,
                              ),
                            );
                          }
                        } else if (confirmPasswordController.text.isEmpty) {
                          if (!Get.isSnackbarOpen) {
                            Get.snackbar(
                              'WARNING',
                              'Please confirm your password',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              duration: Duration(
                                milliseconds: 1000,
                              ),
                            );
                          }
                        } else {
                          signUpData.email.value = emailController.text;
                          signUpData.password.value = passwordController.text;

                          Get.to(Information());
                        }
                      },
                      child: ButtonApiCommon(
                        title: 'Sign Up',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorRes.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.2,
                          vertical: MediaQuery.of(context).size.width * 0.02,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isAgreed = !isAgreed;
                          });
                        },
                        child: Checkbox(
                          checkColor: ColorRes.backColor,
                          fillColor: WidgetStatePropertyAll(
                            ColorRes.whiteColor,
                          ),
                          value: isAgreed,
                          onChanged: (bool? value) {
                            setState(() {
                              isAgreed = value!;
                            });
                          },
                          activeColor: ColorRes.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(text: 'I agree to the '),
                              TextSpan(
                                text: 'Terms & Conditions\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorRes.primaryColor,
                                ),
                              ),
                              TextSpan(text: 'and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorRes.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            SignInScreen(),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorRes.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
