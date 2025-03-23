import 'package:flutter/material.dart';
import 'package:get/get.dart';

// คลาสสำหรับหน้าจอแสดงสตรีมที่จอดรถ เชื่อมต่อกับ BookmarkSubScreenUI
class StreamViewUI extends StatelessWidget {
  final String parkingId;

  const StreamViewUI({super.key, required this.parkingId});

  @override
  Widget build(BuildContext context) {
    // ข้อมูลจากการค้นหา parking ID จาก records (จำลองข้อมูล)
    final Map<String, dynamic> parkingData = {
      'area': 'Eng. building',
      'slot': 'Ground - $parkingId',
      'date': DateTime(2024, 11, 6),
      'time': '12:00:00',
    };

    // สร้างหน้าจอการแสดงผลสตรีมที่จอดรถ
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Parking Information',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        // actions: [
        //   // ปุ่มปิดสำหรับออกจากหน้าจอ
        //   IconButton(
        //     icon: const Icon(Icons.close, color: Colors.black),
        //     onPressed: () => Get.back(),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // หัวข้อการสตรีมที่จอดรถ
            const Text(
              'Parking spot stream',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),

            // พื้นที่สำหรับแสดงวิดีโอสตรีม
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(198, 151, 151, 151),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(Icons.play_arrow, size: 40, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 12),

            // ปุ่มควบคุมการเล่นวิดีโอ
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ปุ่มย้อนกลับ
                IconButton(
                  icon: const Icon(Icons.replay, size: 28),
                  onPressed: () {
                    // ฟังก์ชันสำหรับเล่นวิดีโอย้อนกลับ
                  },
                ),
                const SizedBox(width: 16),

                // ปุ่มหยุดชั่วคราว
                IconButton(
                  icon: const Icon(Icons.pause, size: 28),
                  onPressed: () {
                    // ฟังก์ชันสำหรับหยุดวิดีโอชั่วคราว
                  },
                ),
                const SizedBox(width: 16),

                // ปุ่มไปข้างหน้า
                IconButton(
                  icon: const Icon(Icons.fast_forward, size: 28),
                  onPressed: () {
                    // ฟังก์ชันสำหรับเล่นวิดีโอไปข้างหน้า
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ส่วนแสดงข้อมูลที่จอดรถ
 Container(
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: const Color.fromARGB(123, 204, 203, 203),
    borderRadius: BorderRadius.circular(12),
  ),
  child: Column(
    children: [
      // ข้อมูลพื้นที่จอดรถและช่องจอดรถ อยู่ในบรรทัดเดียวกัน
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ข้อมูลพื้นที่จอดรถ
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Parking Area',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  parkingData['area'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // ข้อมูลช่องจอดรถ
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Parking Slot',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  parkingData['slot'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // ข้อมูลวันที่และเวลา อยู่ในบรรทัดเดียวกัน
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ข้อมูลวันที่
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Date',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_formatDay(parkingData['date'].weekday)} ${parkingData['date'].day} ${_formatMonth(parkingData['date'].month)}, ${parkingData['date'].year}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // ข้อมูลเวลา
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Time',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  parkingData['time'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
),

            
            const Spacer(),

            // ปุ่มตรวจสอบ
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // ฟังก์ชันเมื่อกดปุ่มตรวจสอบ
                  _showCheckoutConfirmation(context, parkingId);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 173, 163, 235),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Check out!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันแสดงหน้าต่างยืนยันการออกจากที่จอดรถ
  void _showCheckoutConfirmation(BuildContext context, String parkingId) {
    Get.dialog(
      AlertDialog(
        title: Text('ยืนยันการออกจากที่จอดรถ: $parkingId'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('คุณต้องการยืนยันการออกจากที่จอดรถนี้หรือไม่?'),
            SizedBox(height: 8),
            Text('หลังจากยืนยัน ระบบจะคำนวณค่าบริการที่จอดรถ'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.back(result: {'status': 'completed', 'id': parkingId});
              Get.snackbar(
                'สำเร็จ',
                'ทำการ Check Out ที่จอดรถ $parkingId เรียบร้อยแล้ว',
                backgroundColor: Colors.green,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: const Text('ยืนยัน'),
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันแปลงวันเป็นข้อความ
  String _formatDay(int day) {
    switch (day) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  // ฟังก์ชันแปลงเดือนเป็นข้อความ
  String _formatMonth(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}

// อัปเดต BookmarkSubScreenUI ในส่วนของการเรียกใช้ StreamViewUI
void updateBookmarkSubScreen() {
  // ตัวอย่างการเรียกใช้งานจาก _buildParkingList ใน BookmarkSubScreenUI
  /*
  leading: GestureDetector(
    onTap: () {
      // เมื่อกดที่ไอคอนกล้อง, นำไปที่หน้า StreamView
      final result = await Get.to(() => StreamViewUI(parkingId: record['id']));
      
      // อัปเดตสถานะหลังจาก check out (ถ้ามี)
      if (result != null && result['status'] == 'completed') {
        setState(() {
          // อัปเดตสถานะการจอดรถในรายการ
          final index = _parkingRecords.indexWhere((item) => item['id'] == result['id']);
          if (index != -1) {
            _parkingRecords[index]['isOngoing'] = false;
            _parkingRecords[index]['status'] = 'Completed';
            _parkingRecords[index]['endTime'] = DateTime.now();
          }
        });
      }
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
  */
}