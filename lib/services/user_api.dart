// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:intelligent_parking_management_with_ai/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:intelligent_parking_management_with_ai/utils/urls.dart';

class UserApi {
  // This class is responsible for making API calls related to user data.
  // It will contain methods to fetch, update, and delete user information.

  static Future<Object> LoginAPI(User user) async {
    final responseData = await http.post(
      Uri.parse(Urls.loginUrl),
      body: jsonEncode(user.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (responseData.statusCode == 200) {
      final responseDataDecoded = jsonDecode(responseData.body);
      List<User> data = [User.fromJson(responseDataDecoded)];
      final token = responseData.headers['authorization'];

      return LoginResponse(user: data, token: token);
    } else {
      List<User> data = [
        User(
          message: '0',
        )
      ];
      return data;
    }
  }

  // This method is used to register a new user.
  static Future<List<User>> RegisterAPI(User user) async {
    final responseData = await http.post(
      Uri.parse(Urls.registerUrl),
      body: jsonEncode(user.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (responseData.statusCode == 200) {
      final responseBody = responseData.body;
      // ถ้าสำเร็จ response จะเป็น plain text เช่น "1"
      if (responseBody.trim() == "1") {
        return [User(message: '1')];
      } else {
        // ถ้าไม่สำเร็จ response จะเป็นข้อความ error
        return [User(message: responseBody)];
      }
    } else {
      return [User(message: '0')];
    }
  }

  static Future<List<User>> UpdateUsernameAPI(
      String userId, User user, String token) async {
    print(Urls.updateUsernameUrl(userId));
    final responseData = await http.put(
      Uri.parse(Urls.updateUsernameUrl(userId)),
      body: jsonEncode(user.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (responseData.statusCode == 200) {
      final responseDataDecoded = jsonDecode(responseData.body);
      List<User> data = [User.fromJson(responseDataDecoded)];
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

  static Future<List<User>> UpdateEmailAPI(
      String userId, User user, String token) async {
    final responseData = await http.put(
      Uri.parse(Urls.updateEmailUrl(userId)),
      body: jsonEncode(user.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (responseData.statusCode == 200) {
      final responseDataDecoded = jsonDecode(responseData.body);
      List<User> data = [User.fromJson(responseDataDecoded)];
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

  static Future<List<User>> UpdatePasswordAPI(
      String userId, User user, String token) async {
    final responseData = await http.put(
      Uri.parse(Urls.updatePasswordUrl(userId)),
      body: jsonEncode(user.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (responseData.statusCode == 200) {
      final responseDataDecoded = jsonDecode(responseData.body);
      List<User> data = [User.fromJson(responseDataDecoded)];
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

  static Future<List<User>> UpdateInfoAPI(
      String userId, User user, String token) async {
    final responseData = await http.put(
      Uri.parse(Urls.updateInfoUrl(userId)),
      body: jsonEncode(user.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (responseData.statusCode == 200) {
      final responseDataDecoded = jsonDecode(responseData.body);
      List<User> data = [User.fromJson(responseDataDecoded)];
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

class LoginResponse {
  final List<User> user;
  final String? token;

  LoginResponse({required this.user, this.token});
}
