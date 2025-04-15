import 'package:flutter/material.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class SearchButtonCommon extends StatefulWidget {
  const SearchButtonCommon({super.key});

  @override
  State<SearchButtonCommon> createState() => _SearchButtonCommonState();
}

class _SearchButtonCommonState extends State<SearchButtonCommon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            color: ColorRes.shadowColor(context),
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
    );
  }
}
