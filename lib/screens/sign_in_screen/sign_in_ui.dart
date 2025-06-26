// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors, sort_child_properties_last, unnecessary_null_comparison, unused_local_variable, unnecessary_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intelligent_parking_management_with_ai/common/back_button.dart';
import 'package:intelligent_parking_management_with_ai/common/button_api.dart';
import 'package:intelligent_parking_management_with_ai/common/button_route.dart';
import 'package:intelligent_parking_management_with_ai/common/text_field.dart';
import 'package:intelligent_parking_management_with_ai/data/user_data.dart';
import 'package:intelligent_parking_management_with_ai/models/user_model.dart';
import 'package:intelligent_parking_management_with_ai/screens/sign_up_screen/sign_up_ui.dart';
import 'package:intelligent_parking_management_with_ai/services/user_api.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';
import 'package:intelligent_parking_management_with_ai/views/main_home_ui.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/ProfilePage.dart';

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
  UserData userData = Get.find();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;

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
            top: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Sign In your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Enter your email and password to login',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
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
                        "Sign In",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
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
                    height: MediaQuery.of(context).size.height * 0.05,
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
                        } else {
                          // Create a User object with the entered email and password
                          User user = User(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );

                          // Call your API or perform login action here
                          UserApi.LoginAPI(user).then(
                            (value) {
                              if (value[0].message == "1") {
                                userData.setId(value[0].id ?? 0);
                                userData.setEmail(value[0].email ?? '');
                                userData.setUsername(value[0].username ?? '');
                                userData.userFullname.value =
                                    value[0].userFullname ?? '';
                                userData.userBirthday.value =
                                    value[0].userBirthday ?? '';
                                userData.userGender.value =
                                    value[0].userGender ?? 0;
                                userData.userProfile.value =
                                    value[0].userProfile ?? '';

                                Get.defaultDialog(
                                  title: 'Login Success',
                                  middleText: 'Welcome back, ${user.id}',
                                  onConfirm: () {
                                    Get.offAll(
                                      MainHomeUI(),
                                    );
                                  },
                                  textConfirm: 'OK',
                                );
                              } else {
                                Get.snackbar(
                                  'WARNING',
                                  'Invalid email or password',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  duration: Duration(
                                    milliseconds: 1000,
                                  ),
                                );
                              }
                            },
                          ).catchError((error) {
                            Get.snackbar(
                              'WARNING',
                              'Login failed',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              duration: Duration(
                                milliseconds: 2000,
                              ),
                            );
                          });
                        }
                      },
                      child: ButtonApiCommon(
                        title: 'Sign In',
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
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('Forgot Password?',
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorRes.primaryColor,
                            )),
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
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            SignUpUI(),
                          );
                        },
                        child: Text(
                          'Sign Up',
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
