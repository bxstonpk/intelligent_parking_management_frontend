// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/common/back_button.dart';
import 'package:intelligent_parking_management_with_ai/common/button_api.dart';
import 'package:intelligent_parking_management_with_ai/data/sign_up_data.dart';
import 'package:intelligent_parking_management_with_ai/models/user_model.dart';
import 'package:intelligent_parking_management_with_ai/screens/sign_in_screen/sign_in_ui.dart';
import 'package:intelligent_parking_management_with_ai/services/user_api.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  SignUpData signUpData = Get.find();

  int selectedGender = 0; // 0: Male, 1: Female, 2: Other

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
                        "Gender",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: ColorRes.whiteColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                color: ColorRes.primaryColor,
                                size: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Radio<int>(
                                value: 0,
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                color: ColorRes.primaryColor,
                                size: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Radio<int>(
                                value: 1,
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.transgender,
                                color: ColorRes.primaryColor,
                                size: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                "Other",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Radio<int>(
                                value: 2,
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        // Prepare data for api call
                        User data = User(
                          username: signUpData.username.value,
                          email: signUpData.email.value,
                          password: signUpData.password.value,
                          userFullname: signUpData.userFullName.value,
                          userBirthday: signUpData.userBirthday.value,
                          userGender: selectedGender,
                        );

                        // Call the API to register the user
                        UserApi.RegisterAPI(data).then((value) {
                          // value[0] อาจเป็นตัวเลขหรือข้อความ
                          if (value[0].message == '1') {
                            // Registration successful, navigate to Sign In screen
                            Get.snackbar(
                              'Success',
                              'Registration successful! Please sign in.',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.green.withOpacity(0.8),
                              colorText: Colors.white,
                            );
                            // sleep to allow the snackbar to show
                            Future.delayed(Duration(seconds: 1), () {
                              // Clear user data
                              signUpData.clearSignUpData();
                            });
                            // Navigate to Sign In screen
                            Get.to(SignInUI());
                          } else {
                            // แสดงข้อความ error ที่ส่งมาจาก API
                            Get.snackbar(
                              'Error',
                              value[0].message ?? 'Unknown error',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.red.withOpacity(0.8),
                              colorText: Colors.white,
                            );
                          }
                        }).catchError((error) {
                          Get.snackbar(
                            'Error',
                            'An error occurred while registering: $error',
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.red.withOpacity(0.8),
                            colorText: Colors.white,
                          );
                        });
                      },
                      child: ButtonApiCommon(
                        title: 'Submit',
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
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(SignInUI());
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorRes.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
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
