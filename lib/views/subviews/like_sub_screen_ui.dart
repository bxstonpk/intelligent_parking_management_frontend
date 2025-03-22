// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/add_plan_screen.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/notify_sub_screen_ui.dart';

class LikeSubScreenUI extends StatefulWidget {
  const LikeSubScreenUI({super.key});

  @override
  State<LikeSubScreenUI> createState() => _LikeSubScreenUIState();
}

class _LikeSubScreenUIState extends State<LikeSubScreenUI> {
  int selectedFilter =
      0; // ใช้เก็บค่าปุ่มที่เลือก (0=Today, 1=Tomorrow, 2=Next week)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 🔔 ปุ่ม Notify
          Positioned(
            top: MediaQuery.of(context).size.height * 0.07,
            right: MediaQuery.of(context).size.width * 0.07,
            child: GestureDetector(
              onTap: () {
                Get.to(NotifySubScreenUI());
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Icon(Icons.notifications, color: Colors.black54),
                ),
              ),
            ),
          ),

          // 📝 หัวข้อ "My Plans"
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            left: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              'My Plans',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),

          // 😊 ข้อความต้อนรับ
          Positioned(
            top: MediaQuery.of(context).size.height * 0.13,
            left: MediaQuery.of(context).size.width * 0.07,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: Text(
              'Have a Good Day,\nUser',
              style: TextStyle(fontSize: 43.0, fontWeight: FontWeight.bold),
            ),
          ),

          // 🔍 ช่องป้อนแผนงาน
          Positioned(
            top: MediaQuery.of(context).size.height * 0.28,
            left: MediaQuery.of(context).size.width * 0.07,
            right: MediaQuery.of(context).size.width * 0.2,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'I have plan to...',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          // ➕ ปุ่มเพิ่มแผน
          Positioned(
            top: MediaQuery.of(context).size.height * 0.28,
            right: MediaQuery.of(context).size.width * 0.07,
            child: GestureDetector(
              onTap: () {
                 Get.to(AddPlanScreen());
                // เพิ่มแผนใหม่
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Color(0xFFADA3EB),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(Icons.add, color: Colors.white, size: 28),
                ),
              ),
            ),
          ),

          // 📅 ปุ่มเลือกช่วงเวลา
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.02,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildFilterButton(
                  "Today",
                  0,
                  Icons.sentiment_satisfied,
                ),
                SizedBox(width: 5),
                buildFilterButton("Tomorrow", 1, Icons.sentiment_neutral),
                SizedBox(width: 5),
                buildFilterButton("Next week", 2, Icons.calendar_today),
              ],
            ),
          ),

          // 📝 รายการแผนงาน
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: MediaQuery.of(context).size.width * 0.07,
            right: MediaQuery.of(context).size.width * 0.07,
            bottom: 110,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 147, 146, 146), width: 2), // กำหนดกรอบ
                borderRadius: BorderRadius.circular(8), // มุมโค้งของกรอบ
              ),
              child: ListView(
                children: [
                  Text(
                    "Wednesday, 06 Nov, 2024",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  buildTaskCard("Southeast Asia University", "12:00"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔘 ปุ่มเลือกช่วงเวลา
  Widget buildFilterButton(String label, int index, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          selectedFilter = index;
        });
      },
      icon: Icon(icon,
          size: 18,
          color: selectedFilter == index ? Colors.white : Colors.black54),
      label: Text(label,
          style: TextStyle(
              color: selectedFilter == index ? Colors.white : Colors.black54)),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            selectedFilter == index ? Color(0xFFADA3EB) : Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  // 📌 การ์ดแสดงแผนงาน
  Widget buildTaskCard(String title, String time) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFEAE6FD),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(time,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
