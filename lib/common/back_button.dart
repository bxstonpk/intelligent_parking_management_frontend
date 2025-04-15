// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class BackButtonCommon extends StatelessWidget {
  final Color? color;

  const BackButtonCommon({super.key, this.color});

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
            color: color ?? ColorRes.primaryColor,
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
    );
  }
}
