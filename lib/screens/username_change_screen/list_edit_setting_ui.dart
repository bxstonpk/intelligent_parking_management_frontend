// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/common/text_field.dart';
import 'package:intelligent_parking_management_with_ai/handlers/api_handles.dart';
import 'package:intelligent_parking_management_with_ai/models/user_model.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class ListEditSettingUI extends StatefulWidget {
  final String title;
  final List<String> ListChange;

  const ListEditSettingUI(
      {super.key, required this.title, required this.ListChange});

  @override
  State<ListEditSettingUI> createState() => _ListEditSettingUIState();
}

class _ListEditSettingUIState extends State<ListEditSettingUI> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    final list = widget.ListChange ?? [];
    _controllers = list.map((item) => TextEditingController()).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorRes.whiteColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Text(
                  'Change ${widget.title}',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              decoration: BoxDecoration(
                color: ColorRes.whiteColor,
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.05,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.ListChange.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          child: TextFieldCommon(
                            controller: _controllers[index],
                            hintText: widget.ListChange[index],
                            isPassword: false,
                            icon: Icon(Icons.edit),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle save changes
                  User? user;
                  if (widget.title == 'Username') {
                    user = User(
                      username: _controllers[0].text,
                    );
                  } else if (widget.title == 'Email') {
                    user = User(email: _controllers[0].text);
                  } else if (widget.title == 'Password') {
                    user = User(
                      password: _controllers[1].text,
                    );
                  } else if (widget.title == 'Info') {
                    user = User(
                      userFullname: _controllers[0].text,
                      userGender: int.tryParse(_controllers[1].text),
                      userBirthday: _controllers[2].text,
                    );
                  }

                  ApiHandles apiHandles = ApiHandles();

                  // Call the API to update changes
                  if (widget.title == 'Username' && user != null) {
                    apiHandles.changeUsername(user).then((response) {
                      if (response == 1) {
                        Get.defaultDialog(
                          title: 'Success',
                          middleText: 'Username updated successfully.',
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: 'OK',
                          confirmTextColor: ColorRes.whiteColor,
                          buttonColor: ColorRes.primaryColor,
                        );
                      } else {
                        Get.defaultDialog(
                          title: 'Error',
                          middleText: 'Failed to update username.',
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: 'OK',
                          confirmTextColor: ColorRes.whiteColor,
                          buttonColor: ColorRes.primaryColor,
                        );
                      }
                    });
                  } else if (widget.title == 'Email' && user != null) {
                    apiHandles.changeEmail(user).then((response) {
                      if (response == 1) {
                        Get.defaultDialog(
                          title: 'Success',
                          middleText: 'Email updated successfully.',
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: 'OK',
                          confirmTextColor: ColorRes.whiteColor,
                          buttonColor: ColorRes.primaryColor,
                        );
                      } else {
                        Get.defaultDialog(
                          title: 'Error',
                          middleText: 'Failed to update email.',
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: 'OK',
                          confirmTextColor: ColorRes.whiteColor,
                          buttonColor: ColorRes.primaryColor,
                        );
                      }
                    });
                  } else if (widget.title == 'Password' && user != null) {
                    apiHandles.changePassword(user).then((response) {
                      if (response == 1) {
                        Get.defaultDialog(
                          title: 'Success',
                          middleText: 'Password updated successfully.',
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: 'OK',
                          confirmTextColor: ColorRes.whiteColor,
                          buttonColor: ColorRes.primaryColor,
                        );
                      } else {
                        Get.defaultDialog(
                          title: 'Error',
                          middleText: 'Failed to update password.',
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: 'OK',
                          confirmTextColor: ColorRes.whiteColor,
                          buttonColor: ColorRes.primaryColor,
                        );
                      }
                    });
                  } else if (widget.title == 'Info' && user != null) {
                    apiHandles
                        .changeInfo(
                      user,
                    )
                        .then((response) {
                      if (response == 1) {
                        Get.defaultDialog(
                          title: 'Success',
                          middleText: 'Info updated successfully.',
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: 'OK',
                          confirmTextColor: ColorRes.whiteColor,
                          buttonColor: ColorRes.primaryColor,
                        );
                      } else {
                        Get.defaultDialog(
                          title: 'Error',
                          middleText: 'Failed to update info.',
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: 'OK',
                          confirmTextColor: ColorRes.whiteColor,
                          buttonColor: ColorRes.primaryColor,
                        );
                      }
                    });
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.07,
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor,
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.08,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Save Changes',
                      style: TextStyle(
                        color: ColorRes.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
