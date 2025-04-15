import 'package:flutter/material.dart';

class ButtonApiCommon extends StatelessWidget {
  final String? title;

  const ButtonApiCommon({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.width * 0.06,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
