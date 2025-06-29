// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/screens/notify_screen/notify_ui.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class NotifyButtonCommon extends StatelessWidget {
  const NotifyButtonCommon({super.key});

  static Color color = ThemeData.dark().brightness == Brightness.light
      ? ColorRes.backSoftColor
      : ColorRes.greyColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.13,
        height: MediaQuery.of(context).size.width * 0.13,
        decoration: BoxDecoration(
          color: ColorRes.buttonColor(context),
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorRes.shadowColor(context),
          ),
        ),
        child: Center(
          child: Icon(
            Icons.notifications,
            color: ColorRes.activeColor(context),
          ),
        ),
      ),
    );
  }
}
