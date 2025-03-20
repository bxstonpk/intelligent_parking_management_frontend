import 'package:flutter/material.dart';

class ParkingUi extends StatefulWidget {
  const ParkingUi({Key? key}) : super(key: key);

  @override
  State<ParkingUi> createState() => _ParkingUiState();
}

class _ParkingUiState extends State<ParkingUi> {
  int selectedFloor = 1;
  final Map<String, bool> parkingSlots = {
    'A01': false,
    'A03': true,
    'A04': true,
    'A05': true,
    'A06': false,
    'A07': false,
    'B01': false,
    'B02': false,
    'B03': false,
    'B04': true,
    'B05': true,
    'B07': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('AI-Powered Parking'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh), // เปลี่ยนไอคอนเป็นรีเฟรช
            onPressed: () {
              setState(() {
                // รีเซ็ตค่าหรือสุ่มสถานะใหม่
                // parkingSlots
                //     .updateAll((key, value) => (value == false) ? true : false);
              });
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // ตัวเลือกชั้น
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: buildFloorButton('1st Floor', 1),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: buildFloorButton('2nd Floor', 2),
                ),
              ],
            ),
          ),

          // ส่วนหัวการนำทางชั้น
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                  iconSize: 20,
                ),
                const Text(
                  'A & B Slots',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {},
                  iconSize: 20,
                ),
              ],
            ),
          ),

          // ตารางช่องจอดรถ
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 246, 246, 246), width: 1),
              ),
              child: buildParkingGrid(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFloorButton(String label, int floor) {
    final isSelected = selectedFloor == floor;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedFloor = floor;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? const Color(0xFFB19CD9) : Colors.grey[200],
        foregroundColor: isSelected ? Colors.white : Colors.grey[800],
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(label),
    );
  }

  Widget buildParkingGrid() {
    // กรองช่องจอดตามชั้นที่เลือก
    final selectedPrefix = selectedFloor == 1 ? 'A' : 'B';

    // ดึงช่องจอด A สำหรับคอลัมน์ที่ 1
    final aSlots = parkingSlots.entries
        .where((entry) => entry.key.startsWith('A'))
        .toList();

    // ดึงช่องจอด B สำหรับคอลัมน์ที่ 2
    final bSlots = parkingSlots.entries
        .where((entry) => entry.key.startsWith('B'))
        .toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // คอลัมน์ซ้าย (ช่องจอด A)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: aSlots
                .map((slot) => buildParkingSlot(slot.key, slot.value))
                .toList(),
          ),
        ),
        // คอลัมน์ขวา (ช่องจอด B)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: bSlots
                .map((slot) => buildParkingSlot(slot.key, slot.value))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget buildParkingSlot(String slotId, bool isOccupied) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      child: Stack(
        children: [
          // ช่องจอดรถ
          Container(
            margin: const EdgeInsets.all(4.0),
            width: 150,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  slotId,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // รถ (ถ้ามีรถจอดอยู่)
          if (isOccupied)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFF3CBBB1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
