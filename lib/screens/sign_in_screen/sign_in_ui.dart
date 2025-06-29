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
import 'package:intelligent_parking_management_with_ai/screens/main_screen/main_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/screens/sign_up_screen/sign_up_ui.dart';
import 'package:intelligent_parking_management_with_ai/services/user_api.dart';
import 'package:intelligent_parking_management_with_ai/utils/Pref_res.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';
import 'package:intelligent_parking_management_with_ai/utils/format_res.dart';
import 'package:intelligent_parking_management_with_ai/utils/token_res.dart';

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
            top: MediaQuery.of(context).size.height * 0.07,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Get.offAll(
                    MainHomeUI(
                      currentIndex: 2,
                    ),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ThemeData.dark().brightness == Brightness.light
                          ? ColorRes.backSoftColor
                          : ColorRes.stockColor,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: ColorRes.whiteColor,
                  ),
                ),
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
                    keyboardType: TextInputType.emailAddress,
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
                        } else if (GetUtils.isEmail(emailController.text) ==
                            false) {
                          if (!Get.isSnackbarOpen) {
                            Get.snackbar(
                              'WARNING',
                              'Please enter a valid email',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              duration: Duration(
                                milliseconds: 1000,
                              ),
                            );
                          }
                        } else if (!CheckFormatRes.isPasswordValid(
                            passwordController.text)) {
                          if (!Get.isSnackbarOpen) {
                            Get.snackbar(
                              'WARNING',
                              'Please enter a valid password',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              duration: Duration(
                                milliseconds: 1000,
                              ),
                            );
                          }
                        } else {
                          User userReq = User(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          UserApi.LoginAPI(userReq).then((loginResponse) {
                            // Cast loginResponse to the correct type, e.g., LoginResponse
                            final response = loginResponse as LoginResponse;
                            final userList = response.user;
                            final token = response.token;

                            print('Token: $token');
                            print('User Id: ${userList[0].id}');

                            if (userList[0].id != null && userList[0].id != 0) {
                              // Set user data in shared preferences
                              PrefRes prefRes = PrefRes();
                              TokenStorageService tokenStorageService =
                                  TokenStorageService();

                              // Set user data
                              User user = userList[0];
                              prefRes.setUserData(user).then((_) {
                                // Set user data in UserData
                                userData.setId(user.id ?? 0);
                                userData.setEmail(user.email ?? '');
                                userData.setUsername(user.username ?? '');
                                userData.userFullname.value =
                                    user.userFullname ?? '';
                                userData.userBirthday.value =
                                    user.userBirthday ?? '';
                                userData.userGender.value =
                                    user.userGender ?? 0;
                                userData.userProfile.value =
                                    user.userProfile ?? '';
                              });

                              // Save token
                              // String token = response.headers['authorization']; // Remove or fix this line if response is not available
                              tokenStorageService.saveToken(token ?? '');

                              // Set isLogin = true in SharedPreferences
                              prefRes.setIsLoggedIn(true).then((_) {
                                // Navigate to MainHomeUI
                                Get.defaultDialog(
                                  title: 'SUCCESS',
                                  middleText: 'Login successful',
                                  backgroundColor: Colors.green,
                                  titleStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  middleTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  barrierDismissible:
                                      false, // ป้องกันการปิด dialog โดยการแตะนอกกรอบ
                                  onConfirm: () {
                                    Get.back(); // ปิด dialog ก่อน
                                    // ใช้ Future.delayed เพื่อให้แน่ใจว่า dialog ปิดแล้ว
                                    Future.delayed(Duration(milliseconds: 100),
                                        () {
                                      Get.offAll(
                                          () => MainHomeUI(currentIndex: 2));
                                    });
                                  },
                                  textConfirm: 'OK',
                                  confirmTextColor: Colors.white,
                                  buttonColor: Colors.green,
                                );
                              });
                            } else {
                              Get.snackbar(
                                'Error',
                                userList[0].toString(),
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red.withOpacity(0.8),
                                colorText: Colors.white,
                              );
                            }
                          }).catchError((error) {
                            Get.snackbar(
                              'Error',
                              'An error occurred while logging in: $error',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.red.withOpacity(0.8),
                              colorText: Colors.white,
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
                            () => SignUpUI(),
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
