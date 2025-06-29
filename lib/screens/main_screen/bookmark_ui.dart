// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/screens/stream_screen/stream_ui.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';
import 'package:intelligent_parking_management_with_ai/utils/format_res.dart';

class BookmarkUI extends StatefulWidget {
  const BookmarkUI({super.key});

  @override
  State<BookmarkUI> createState() => _BookmarkUIState();
}

class _BookmarkUIState extends State<BookmarkUI>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  final List<Map<String, dynamic>> _parkingRecords = [
    {
      'id': 'Indoor',
      'status': 'Active',
      'location': 'Parking building',
      'startTime': DateTime.now().subtract(
        Duration(hours: 2),
      ),
      'endTime': DateTime.now().add(
        Duration(hours: 3),
      ),
      'isIndoor': true,
    },
    {
      'id': 'Outdoor',
      'status': 'Active',
      'location': 'Engineering building',
      'startTime': DateTime.now().subtract(
        Duration(days: 1, hours: 5),
      ),
      'endTime': DateTime.now().subtract(
        Duration(hours: 1),
      ),
      'isIndoor': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Parkings',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: ColorRes.backColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.12,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.76,
              decoration: BoxDecoration(
                color: Color.fromARGB(198, 151, 151, 151),
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.06,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 6,
                    blurRadius: 10,
                    offset: Offset(
                      0,
                      3,
                    ),
                  ),
                ],
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(),
                tabs: [
                  _buildTab(
                    'Indoor',
                    0,
                  ),
                  _buildTab(
                    'Outdoor',
                    1,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ClipRect(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildParkingList(true),
                  _buildParkingList(false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom Tab Button
  Widget _buildTab(String label, int index) {
    return Tab(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        decoration: BoxDecoration(
          color: _selectedTabIndex == index ? ColorRes.yellowColor : null,
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * 0.05,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: ColorRes.backColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildParkingList(bool isIndoor) {
    final filteredList = _parkingRecords
        .where((record) => record['isIndoor'] == isIndoor)
        .toList();

    return ListView.builder(
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.05,
      ),
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final record = filteredList[index];
        return Card(
          elevation: 0,
          color: ColorRes.greyColor,
          margin: EdgeInsets.only(
            bottom: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            leading: GestureDetector(
              onTap: () {
                if (record['isIndoor']) {
                  Get.to(
                    StreamUI(id: '1'),
                  );
                } else if (record['isIndoor'] == false) {
                  Get.to(
                    () => StreamUI(id: '2'),
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width * 0.02,
                ),
                decoration: BoxDecoration(
                  color: ColorRes.whiteColor,
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                child: Icon(
                  record['isIndoor']
                      ? Icons.videocam_sharp
                      : Icons.videocam_sharp,
                  color: record['isIndoor']
                      ? ColorRes.primaryColor
                      : ColorRes.primaryColor,
                ),
              ),
            ),
            title: Row(
              children: [
                Text(
                  record['id'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: ColorRes.whiteColor,
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    border: Border.all(
                      color: ColorRes.greyColor,
                    ),
                  ),
                  child: Text(
                    record['status'],
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  record['location'],
                ),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  color: ColorRes.stockColor,
                ),
                GestureDetector(
                  onTap: () {
                    _showParkingDetails(record);
                  },
                  child: Text(
                    'View Information',
                    style: TextStyle(
                      color: ColorRes.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            onTap: () {
              _showParkingDetails(record);
            },
          ),
        );
      },
    );
  }

  void _showParkingDetails(Map<String, dynamic> record) {
    Get.dialog(
      AlertDialog(
        title: Text('รายละเอียดการจอดรถ: ${record['id']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'สถานที่: ${record['location']}',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'สถานะ: ${record['status']}',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'เวลาเริ่มต้น: ${FormatRes.formatDateTime(record['startTime'])}',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'เวลาสิ้นสุด: ${FormatRes.formatDateTime(record['endTime'])}',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'ปิด',
            ),
          ),
        ],
      ),
    );
  }
}
