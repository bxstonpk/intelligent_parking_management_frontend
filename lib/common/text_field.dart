// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';

class TextFieldCommon extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? password;
  final bool? isPassword;

  const TextFieldCommon({
    super.key,
    required this.controller,
    required this.hintText,
    this.password,
    this.isPassword = false,
  });

  @override
  State<TextFieldCommon> createState() => _TextFieldCommonState();
}

class _TextFieldCommonState extends State<TextFieldCommon> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = widget.isPassword ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isPasswordVisible,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: ColorRes.backSoftColor,
        ),
        suffixIcon: widget.password == true
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: ColorRes.backSoftColor,
                ),
                onPressed: () {
                  setState(
                    () {
                      _isPasswordVisible = !_isPasswordVisible;
                    },
                  );
                },
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
    );
  }
}
