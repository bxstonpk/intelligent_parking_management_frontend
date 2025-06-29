// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:intelligent_parking_management_with_ai/common/back_button.dart';
import 'package:intelligent_parking_management_with_ai/services/spot_api.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class ViewParkingUI extends StatefulWidget {
  final int? currentIndex;
  final String? parkingArea;

  const ViewParkingUI({super.key, this.currentIndex = 1, this.parkingArea});

  @override
  State<ViewParkingUI> createState() => _ViewParkingUIState();
}

class _ViewParkingUIState extends State<ViewParkingUI> {
  late int _currentIndex;
  String? cameraName;

  final Map<String, bool> parkingSlots = {};

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex!;
    // เรียก API spot ทุกครั้งที่เปิดหน้านี้
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchParkingSpots();
    });
  }

  Future<void> fetchParkingSpots() async {
    String? selectedCamera;

    if (widget.parkingArea == 'Engineer Building') {
      selectedCamera = 'camera_2';
    } else if (widget.parkingArea == 'Parking Terminal') {
      selectedCamera = 'camera_1';
    }

    if (selectedCamera != null) {
      try {
        final value = await SpotApi.getLatestSpots(selectedCamera);
        print(value);
        setState(() {
          parkingSlots.clear();
          if (value.parkingSpots != null) {
            for (var spot in value.parkingSpots!) {
              parkingSlots[spot.spotName ?? ''] = spot.isOccupied ?? false;
            }
          }
          print(parkingSlots);
        });
      } catch (error) {
        print('❌ Error fetching parking spots: $error');
      }
    } else {
      print('⚠️ Unknown parking area: ${widget.parkingArea}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonCommon(
                    color: ColorRes.buttonColor(context),
                  ),
                  Text(
                    'AI-Powered Parking',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorRes.backColor,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.08,
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.86,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        50,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.parkingArea ?? 'Parking Area',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorRes.backColor,
                        ),
                      ),
                    ],
                  )),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: MediaQuery.of(context).size.width * 0.86,
                height: MediaQuery.of(context).size.height * 0.65,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.width * 0.03,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorRes.whiteColor,
                            width: 1,
                          ),
                        ),
                        child: buildParkingGrid(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildParkingGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: parkingSlots.keys
          .map((slot) => buildParkingSlot(slot, parkingSlots[slot] ?? false))
          .toList(),
    );
  }

  Widget buildParkingSlot(String slotId, bool isOccupied) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 16.0,
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(
              4.0,
            ),
            width: 200,
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
          if (isOccupied)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: Center(
                  child: Transform.scale(
                    scaleX: -1,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Color.fromARGB(255, 11, 126, 99),
                        BlendMode.srcIn,
                      ),
                      child: Image(
                        image: AssetImage(
                          'assets/images/car.png',
                        ),
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
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
