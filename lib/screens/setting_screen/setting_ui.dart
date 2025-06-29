// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/models/user_model.dart';
import 'package:intelligent_parking_management_with_ai/screens/main_screen/main_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/screens/username_change_screen/list_edit_setting_ui.dart';
import 'package:intelligent_parking_management_with_ai/utils/Pref_res.dart';
import 'package:intelligent_parking_management_with_ai/utils/change_list.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class SettingUI extends StatefulWidget {
  const SettingUI({super.key});

  @override
  State<SettingUI> createState() => _SettingUIState();
}

class _SettingUIState extends State<SettingUI> {
  PrefRes prefRes = PrefRes();
  User user = User();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    User userData = await prefRes.getUserData();
    setState(() {
      user = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: ColorRes.backColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorRes.whiteColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.11,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              decoration: BoxDecoration(
                color: ColorRes.primaryColor,
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.05,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.08,
                    backgroundColor: ColorRes.primaryColor,
                    child: Image.asset(
                      'assets/images/LGBTQ.png',
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Text(
                    (user.userFullname != null && user.userFullname!.isNotEmpty)
                        ? user.userFullname!
                        : 'User Name',
                    style: TextStyle(
                      color: ColorRes.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.38,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'Account Settings',
                      style: TextStyle(
                        color: ColorRes.backColor,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Divider(
                  color: ColorRes.greyColor,
                  thickness: 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ListEditSettingUI(
                        title: 'Username',
                        ListChange: ChangeList.Username,
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: ColorRes.backColor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                'Username',
                                style: TextStyle(
                                  color: ColorRes.backColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: ColorRes.backColor,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ListEditSettingUI(
                        title: 'Email',
                        ListChange: ChangeList.Email,
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: ColorRes.backColor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                'Email',
                                style: TextStyle(
                                  color: ColorRes.backColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: ColorRes.backColor,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ListEditSettingUI(
                        title: 'Password',
                        ListChange: ChangeList.Password,
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.password,
                                color: ColorRes.backColor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                'Password',
                                style: TextStyle(
                                  color: ColorRes.backColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: ColorRes.backColor,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ListEditSettingUI(
                        title: 'Information',
                        ListChange: ChangeList.Info,
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.info,
                                color: ColorRes.backColor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                'Information',
                                style: TextStyle(
                                  color: ColorRes.backColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: ColorRes.backColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          GestureDetector(
            onTap: () async {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text('Logout'),
                  content: Text('Are you sure you want to log out?'),
                  actions: [
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () async {
                        await prefRes.clearLoginStatus();
                        Get.offAll(() => MainHomeUI());
                      },
                      child: Text('Log out'),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.09,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout,
                    color: ColorRes.backColor,
                    size: MediaQuery.of(context).size.width * 0.05,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    'Log out',
                    style: TextStyle(
                      color: ColorRes.backColor,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
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
