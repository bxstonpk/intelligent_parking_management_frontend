import 'package:flutter/material.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class SearchBarCommon extends StatefulWidget {
  const SearchBarCommon({super.key});

  @override
  State<SearchBarCommon> createState() => _SearchBarCommonState();
}

class _SearchBarCommonState extends State<SearchBarCommon> {
  static String searchTextHint = 'Search for parking...';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: searchTextHint,
        hintStyle: TextStyle(
          color: ColorRes.shadowColor(context),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * 0.5,
          ),
          borderSide: BorderSide(
            color: ColorRes.shadowColor(context),
          ),
        ),
      ),
    );
  }
}
