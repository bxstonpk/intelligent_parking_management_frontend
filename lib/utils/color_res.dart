// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ColorRes {
  static const Color primaryColor = Color(0xFFADA3EB);
  static const Color yellowColor = Color(0xFFFFEE49);
  static const Color greyColor = Color(0xFFE8E8E8);
  static const Color backSoftColor = Color(0xFF131313);
  static const Color backColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color stockColor = Color(0xFFC4C4C4);
  static const Color redColor = Color(0xFFF44336);

  static Color buttonColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Color(0xFFE8E8E8) // #E8E8E8
        : Color(0xFF131313); // #131313
  }

  static Color shadowColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Color(0xFFC4C4C4) // #C4C4C4
        : Color(0xFF353333); // #353333
  }

  static Color activeColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Color(0xFF353333) // #353333
        : Color(0xFFE8E8E8); // #E8E8E8
  }
}
