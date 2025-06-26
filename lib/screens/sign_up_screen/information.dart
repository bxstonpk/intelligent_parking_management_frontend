// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/common/back_button.dart';
import 'package:intelligent_parking_management_with_ai/common/button_api.dart';
import 'package:intelligent_parking_management_with_ai/common/text_field.dart';
import 'package:intelligent_parking_management_with_ai/data/sign_up_data.dart';
import 'package:intelligent_parking_management_with_ai/screens/sign_in_screen/sign_in_ui.dart';
import 'package:intelligent_parking_management_with_ai/screens/sign_up_screen/gender.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  SignUpData signUpData = Get.find();

  TextEditingController usernameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

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
                    "Will Success Soon",
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
                        "More Information",
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
                    controller: usernameController,
                    hintText: 'Username',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFieldCommon(
                    controller: fullNameController,
                    hintText: 'Full Name',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextField(
                    controller: dateOfBirthController,
                    decoration: InputDecoration(
                      hintText: 'dd/mm/yyyy',
                      hintStyle: TextStyle(
                        color: ColorRes.backSoftColor,
                      ),
                      suffixIcon: Icon(
                        FontAwesomeIcons.calendar,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              dialogBackgroundColor: Colors.white,
                              colorScheme: const ColorScheme.light(
                                primary: Colors.black, // สีหัวข้อบนสุด
                                onPrimary: Colors.white, // สีปุ่ม "ตกลง"
                                onSurface: Colors.black, // สีของวัน/ตัวอักษร
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Colors.black, // สีปุ่ม Cancel/OK
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (pickedDate != null) {
                        setState(() {
                          dateOfBirthController.text =
                              "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        if (usernameController.text.isEmpty) {
                          if (!Get.isSnackbarOpen) {
                            Get.snackbar(
                              'WARNING',
                              'Please enter your username',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              duration: Duration(
                                milliseconds: 1000,
                              ),
                            );
                          }
                        } else if (fullNameController.text.isEmpty) {
                          if (!Get.isSnackbarOpen) {
                            Get.snackbar(
                              'WARNING',
                              'Please enter your full name',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              duration: Duration(
                                milliseconds: 1000,
                              ),
                            );
                          }
                        } else if (dateOfBirthController.text.isEmpty) {
                          if (!Get.isSnackbarOpen) {
                            Get.snackbar(
                              'WARNING',
                              'Please enter your date of birth',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              duration: Duration(
                                milliseconds: 1000,
                              ),
                            );
                          }
                        } else {
                          signUpData.username.value = usernameController.text;
                          signUpData.userFullName.value =
                              fullNameController.text;
                          signUpData.userBirthday.value =
                              dateOfBirthController.text;

                          Get.to(
                            Gender(),
                          );
                        }
                      },
                      child: ButtonApiCommon(
                        title: 'Next',
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
