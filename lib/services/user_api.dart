// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:intelligent_parking_management_with_ai/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:intelligent_parking_management_with_ai/utils/urls.dart';

class UserApi {
  // This class is responsible for making API calls related to user data.
  // It will contain methods to fetch, update, and delete user information.

  static Future<List<User>> LoginAPI(User user) async {
    final responseData = await http.post(
      Uri.parse(Urls.loginUrl),
      body: jsonEncode(user.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (responseData.statusCode == 200) {
      final responseDataDecoded = jsonDecode(responseData.body);
      List<User> data = await responseDataDecoded
          .map<User>((json) => User.fromJson(json))
          .toList();
      return data;
    } else {
      List<User> data = [
        User(
          message: '0',
        )
      ];
      return data;
    }
  }
}
