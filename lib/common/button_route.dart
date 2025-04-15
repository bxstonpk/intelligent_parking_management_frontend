// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class ButtonrouteCommon extends StatefulWidget {
  final String? title;
  final Widget? route;

  const ButtonrouteCommon({
    super.key,
    required this.title,
    this.route,
  });

  @override
  State<ButtonrouteCommon> createState() => _ButtonrouteCommonState();
}

class _ButtonrouteCommonState extends State<ButtonrouteCommon> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(
          widget.route!,
          transition: Transition.rightToLeft,
          duration: Duration(milliseconds: 300),
        );
      },
      child: Text(
        widget.title!,
        style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * 0.06,
          fontWeight: FontWeight.bold,
        ),
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
    );
  }
}
