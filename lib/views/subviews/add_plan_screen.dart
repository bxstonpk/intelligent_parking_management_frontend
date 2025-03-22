// ignore_for_file: unused_import

import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPlanScreen extends StatefulWidget {
  const AddPlanScreen({super.key});

  @override
  State<AddPlanScreen> createState() => _AddPlanScreenState();
}

class _AddPlanScreenState extends State<AddPlanScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String repeatValue = 'Never';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  // ฟังก์ชันสำหรับเลือกวันที่
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2020),
          lastDate: DateTime(2101),
        ) ??
        selectedDate;

    setState(() {
      selectedDate = picked;
    });
  }

  // ฟังก์ชันสำหรับเลือกเวลา
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
          context: context,
          initialTime: selectedTime,
        ) ??
        selectedTime;

    setState(() {
      selectedTime = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 50,
              color: Colors.black87,
            ),
            onPressed: Navigator.of(context).pop),
        title: Text(
          'My Plans',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 😊 ข้อความต้อนรับ
          Positioned(
            top: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.07,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: Text(
              'Have a Good Day,\nUser',
              style: TextStyle(fontSize: 43.0, fontWeight: FontWeight.bold),
            ),
          ),

          // 📝 ฟอร์มแก้ไขแผน
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.07,
            right: MediaQuery.of(context).size.width * 0.07,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(166, 224, 224, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // ปุ่ม Cancel และ Done
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Cancel',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),

                  // ช่อง Title และ Location
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 209, 209, 209),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                          ),
                        ),
                        Divider(height: 1, color: Colors.grey),
                        TextField(
                          controller: locationController,
                          decoration: InputDecoration(
                            labelText: 'Location',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),

                  // ช่อง Date และ Time
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 209, 209, 209),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Date'),
                          trailing: Text(
                              '${selectedDate.toLocal()}'.split(' ')[0],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          dense: true,
                          onTap: () => _selectDate(context),
                        ),
                        Divider(height: 1, color: Colors.grey),
                        ListTile(
                          title: Text('Time'),
                          trailing: Text('${selectedTime.format(context)}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          dense: true,
                          onTap: () => _selectTime(context),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),

                  // ช่อง Repeat
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 209, 209, 209),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text('Repeat'),
                      trailing: DropdownButton<String>(
                        value: repeatValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            repeatValue = newValue!;
                          });
                        },
                        items: <String>['Never', 'Daily', 'Weekly', 'Monthly']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          );
                        }).toList(),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      dense: true,
                    ),
                  ),

                  SizedBox(height: 25),

                  // ปุ่ม Done
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Delete event logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFBFB1F9),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text('Done',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
