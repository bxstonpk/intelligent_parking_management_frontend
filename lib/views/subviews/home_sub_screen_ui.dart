import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/views/subviews/Parking_Ui/parking_ui.dart';
import 'notify_sub_screen_ui.dart';

class HomeSubScreenUI extends StatefulWidget {
  const HomeSubScreenUI({super.key});

  @override
  State<HomeSubScreenUI> createState() => _HomeSubScreenUIState();
}

class _HomeSubScreenUIState extends State<HomeSubScreenUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.07,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ** ปุ่ม Notify ด้านขวาบน **
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(NotifySubScreenUI());
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.purple[200],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // ** Title **
                Text(
                  'Intelligent Parking...',
                  style: TextStyle(fontSize: 25.0),
                ),

                SizedBox(height: 10),

                // ** Head Topic **
                Text(
                  'Find Your \nParking Space',
                  style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                // ** Search Bar **
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search for parking...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // กดปุ่มค้นหา
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.purple[200],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.search, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // ** Section: Recept Places **
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recept Places',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(color: Colors.purple[200]),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // ** รูปภาพที่กดได้ **
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ParkingUi()),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/sau.jpg',
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // ** Section: Recept Spaces **
                Text(
                  'Recept Spaces',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
