// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/Parking_Ui/parking_ui.dart';

class SpotAreaCommon extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;

  const SpotAreaCommon({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  State<SpotAreaCommon> createState() => _SpotAreaCommonState();
}

class _SpotAreaCommonState extends State<SpotAreaCommon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          ParkingUi(),
        );
      },
      child: Container(
        margin: EdgeInsets.all(
          MediaQuery.of(context).size.width * 0.02,
        ),
        decoration: BoxDecoration(
          color: ColorRes.greyColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.width * 0.02,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      widget.imageUrl!,
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              widget.title!,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.subtitle!,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 12,
                color: ThemeData.dark().brightness == Brightness.light
                    ? ColorRes.greyColor
                    : ColorRes.backColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
