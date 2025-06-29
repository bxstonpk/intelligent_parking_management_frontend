// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intelligent_parking_management_with_ai/common/favorit_space.dart';
import 'package:intelligent_parking_management_with_ai/common/search_bar.dart';
import 'package:intelligent_parking_management_with_ai/common/search_button.dart';
import 'package:intelligent_parking_management_with_ai/common/spot_area.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  List<Map<String, String>> parkingList = [
    {
      'imageUrl': 'assets/images/sau.jpg',
      'title': 'Southeast Asia University',
      'subtitle': 'Engineer Building',
    },
    {
      'imageUrl': 'assets/images/sau.jpg',
      'title': 'Southeast Asia University',
      'subtitle': 'Parking Terminal',
    },
  ];

  List<Map<String, String>> favariteList = [
    {
      'imageUrl': 'assets/images/sau.jpg',
      'title': 'Southeast Asia University',
      'subtitle': 'Engineer Building',
      'freeSpot': '5',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Positioned(
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
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.07,
                          child: Text(
                            'Find Your \nParking Space',
                            style: TextStyle(
                              fontSize: 48.0,
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.22,
                          left: MediaQuery.of(context).size.width * 0.07,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: SearchBarCommon(),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.22,
                          right: MediaQuery.of(context).size.width * 0.07,
                          child: SearchButtonCommon(),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.3,
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
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.29,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Add your onPressed code here!
                                      },
                                      child: Text(
                                        'See All',
                                        style: TextStyle(
                                          color: Color(0xFFADA3EB),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
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
                          top: MediaQuery.of(context).size.height * 0.35,
                          right: 0,
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.04,
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.26,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    parkingList.length,
                                    (i) => SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.26,
                                      child: SpotAreaCommon(
                                        imageUrl: parkingList[i]['imageUrl']!,
                                        title: parkingList[i]['title']!,
                                        subtitle: parkingList[i]['subtitle']!,
                                        parkingArea:
                                            '${parkingList[i]['subtitle']}',
                                        currentIndex: i,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.62,
                          left: MediaQuery.of(context).size.width * 0.07,
                          child: Text(
                            'Favorite Space',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.67,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                right:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.17,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    favariteList.length,
                                    (i) => SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.92,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.22,
                                      child: FavoritSpaceCommon(
                                        imageUrl: favariteList[i]['imageUrl']!,
                                        title: favariteList[i]['title']!,
                                        subtitle: favariteList[i]['subtitle']!,
                                        freeSpot: favariteList[i]['freeSpot'],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
