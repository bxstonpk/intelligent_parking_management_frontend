// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/main.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/notify_sub_screen_ui.dart';


class LikeSubScreenUI extends StatefulWidget {
  const LikeSubScreenUI({super.key});

  @override
  State<LikeSubScreenUI> createState() => _LikeSubScreenUIState();
}

class _LikeSubScreenUIState extends State<LikeSubScreenUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /* ปุ่ม Notify */
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            right: MediaQuery.of(context).size.width * 0.07,
            child: GestureDetector(
              onTap: () {
                Get.to(
                  NotifySubScreenUI(),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.13,
                height: MediaQuery.of(context).size.width * 0.13,
                decoration: BoxDecoration(
                  color: Environment.buttonColor(context),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Environment.shadowColor(context),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications,
                    color: Environment.activeColor(context),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            left: MediaQuery.of(context).size.width * 0.07,
            child: Container(
              child: Text(
                'My Plans',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.125,
            left: MediaQuery.of(context).size.width * 0.07,
            child: Text(
              'Have a Good Day,\nUser',
              style: TextStyle(
                fontSize: 48.0,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.29,
            left: MediaQuery.of(context).size.width * 0.07,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.07,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'I have plan to...',
                  hintStyle: TextStyle(
                    color: Environment.shadowColor(context),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.5,
                    ),
                    borderSide: BorderSide(
                      color: Environment.shadowColor(context),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.29,
            right: MediaQuery.of(context).size.width * 0.07,
            child: GestureDetector(
              onTap: () {
                // Add your onPressed code here!
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.135,
                height: MediaQuery.of(context).size.width * 0.135,
                decoration: BoxDecoration(
                  color: Color(0xFFADA3EB),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Environment.shadowColor(context),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
