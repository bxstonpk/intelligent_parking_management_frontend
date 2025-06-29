// ignore_for_file: prefer_const_constructors, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/screens/main_screen/main_screen_ui.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class BackButtonCommon extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final Color? iconColor;
  final Icon? icon;

  const BackButtonCommon(
      {super.key, this.color, this.child, this.iconColor, this.icon});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color != null ? color : ColorRes.greyColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: ThemeData.dark().brightness == Brightness.light
                  ? ColorRes.backSoftColor
                  : ColorRes.stockColor,
              width: 2,
            ),
          ),
          child: Icon(
            icon != null ? icon?.icon : Icons.arrow_back,
            color: iconColor ?? ColorRes.backSoftColor,
          ),
        ),
      ),
    );
  }
}
