import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/StreamView/stream_view_ui.dart';

class BookmarkSubScreenUI extends StatefulWidget {
  const BookmarkSubScreenUI({super.key});

  @override
  State<BookmarkSubScreenUI> createState() => _BookmarkSubScreenUIState();
}

class _BookmarkSubScreenUIState extends State<BookmarkSubScreenUI>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;
  int _unreadNotificationCount = 3;

  final List<Map<String, dynamic>> _parkingRecords = [
    {
      'id': 'A01',
      'status': 'Active',
      'location': 'Southeast Asia University Eng building',
      'startTime': DateTime.now().subtract(const Duration(hours: 2)),
      'endTime': DateTime.now().add(const Duration(hours: 3)),
      'isOngoing': true,
    },
    {
      'id': 'A02',
      'status': 'Completed',
      'location': 'Central Park',
      'startTime': DateTime.now().subtract(const Duration(days: 1, hours: 5)),
      'endTime': DateTime.now().subtract(const Duration(hours: 1)),
      'isOngoing': false,
    },
    {
      'id': 'A03',
      'status': 'Completed',
      'location': 'Southeast Asia University North building',
      'startTime': DateTime.now().subtract(const Duration(days: 2, hours: 6)),
      'endTime': DateTime.now().subtract(const Duration(days: 1, hours: 1)),
      'isOngoing': false,
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
        title: const Text(
          'My Parkings',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          // Custom Tab Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 9),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(198, 151, 151, 151),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 6,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              ),
              child: TabBar(
                controller: _tabController,
                indicator: const BoxDecoration(),
                tabs: [
                  _buildTab('Ongoing', 0),
                  _buildTab('Completed', 1),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          // TabBarView
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
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: _selectedTabIndex == index
              ? const Color.fromARGB(255, 235, 217, 55)
              : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildParkingList(bool isOngoing) {
    final filteredList = _parkingRecords
        .where((record) => record['isOngoing'] == isOngoing)
        .toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final record = filteredList[index];
        return Card(
          elevation: 0,
          color: Color.fromARGB(123, 204, 203, 203),
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: GestureDetector(
              onTap: () {
                // เมื่อกดที่ไอคอนกล้อง, นำไปที่หน้า StreamView
                Get.to(() => StreamViewUI(parkingId: record['id']));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.videocam_sharp, color: Colors.green),
              ),
            ),
            title: Row(
              children: [
                Text(
                  record['id'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: const Color.fromARGB(255, 132, 132, 132)),
                  ),
                  child: Text(
                    record['status'],
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(record['location']),
                const SizedBox(height: 5),
                Divider(color: Colors.grey),
                GestureDetector(
                  onTap: () {
                    _showParkingDetails(record);
                  },
                  child: const Text(
                    'View Information',
                    style: TextStyle(
                        color: Color.fromARGB(255, 173, 163, 235),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
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
            Text('สถานที่: ${record['location']}'),
            const SizedBox(height: 8),
            Text('สถานะ: ${record['status']}'),
            const SizedBox(height: 8),
            Text('เวลาเริ่มต้น: ${_formatDateTime(record['startTime'])}'),
            const SizedBox(height: 8),
            Text('เวลาสิ้นสุด: ${_formatDateTime(record['endTime'])}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('ปิด'),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
