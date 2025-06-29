// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/screens/parking_screen/view_parking_ui.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class SpotAreaCommon extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;

  final String? parkingArea;
  final int? currentIndex;

  const SpotAreaCommon({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.parkingArea,
    this.currentIndex,
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
          ViewParkingUI(
            currentIndex: widget.currentIndex ?? 1,
            parkingArea: widget.parkingArea ?? 'Default Area',
          ),
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
