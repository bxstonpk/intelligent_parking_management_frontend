// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intelligent_parking_management_with_ai/main.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/notify_sub_screen_ui.dart';
import 'package:get/get.dart';

class HomeSubScreenUI extends StatefulWidget {
  const HomeSubScreenUI({super.key});

  @override
  State<HomeSubScreenUI> createState() => _HomeSubScreenUIState();
}

class _HomeSubScreenUIState extends State<HomeSubScreenUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // Title of page
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            left: MediaQuery.of(context).size.width * 0.07,
            child: Container(
              child: Text(
                'Intelligent Parking...',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          // Head Topic
          Positioned(
            top: MediaQuery.of(context).size.height * 0.125,
            left: MediaQuery.of(context).size.width * 0.07,
            child: Text(
              'Find Your \nParking Space',
              style: TextStyle(
                fontSize: 48.0,
              ),
            ),
          ),
          // Search bar
          Positioned(
            top: MediaQuery.of(context).size.height * 0.29,
            left: MediaQuery.of(context).size.width * 0.07,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.07,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search for parking...',
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
                    Icons.search,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.37,
            child: Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.07,
                left: MediaQuery.of(context).size.width * 0.07,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Recept Places',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.29,
                      ),
                      TextButton(
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: Color(0xFFADA3EB),
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.57,
            left: MediaQuery.of(context).size.width * 0.07,
            child: Text(
              'Recept Spaces',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
