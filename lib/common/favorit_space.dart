// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/screens/parking_screen/view_parking_ui.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class FavoritSpaceCommon extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final String? freeSpot;

  const FavoritSpaceCommon({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.freeSpot,
  });

  @override
  State<FavoritSpaceCommon> createState() => _FavoritSpaceCommonState();
}

class _FavoritSpaceCommonState extends State<FavoritSpaceCommon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          ViewParkingUI(),
        );
      },
      child: Container(
        margin: EdgeInsets.all(
          MediaQuery.of(context).size.width * 0.02,
        ),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: ColorRes.greyColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title!,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    widget.subtitle!,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: ThemeData.dark().brightness == Brightness.light
                          ? ColorRes.greyColor
                          : ColorRes.backColor,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: BoxDecoration(
                      color: ColorRes.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.freeSpot!,
                          style: TextStyle(
                            color: ColorRes.whiteColor,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          ' free spaces',
                          style: TextStyle(
                            color: ColorRes.whiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            widget.imageUrl!,
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
            )
          ],
        ),
      ),
    );
  }
}
