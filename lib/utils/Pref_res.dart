// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intelligent_parking_management_with_ai/models/user_model.dart';

class PrefRes {
  static const _isLoggedIn = 'isLoggedIn';

  Future<void> setIsLoggedIn(bool value) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: _isLoggedIn, value: value.toString());
  }

  Future<bool> getIsLoggedIn() async {
    final storage = FlutterSecureStorage();
    String? value = await storage.read(key: _isLoggedIn);
    return value == 'true' ? true : false;
  }

  Future<void> clearLoginStatus() async {
    final storage = FlutterSecureStorage();
    await storage.deleteAll();
  }

  static const _id = 'id';
  static const _email = 'email';
  static const _username = 'username';
  static const _userFullname = 'userFullname';
  static const _userBirthday = 'userBirthday';
  static const _userGender = 'userGender';
  static const _userProfile = 'userProfile';

  // Setters private data
  Future<void> setUserData(User user) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: _id, value: user.id.toString());
    await storage.write(key: _email, value: user.email);
    await storage.write(key: _username, value: user.username);
    await storage.write(key: _userFullname, value: user.userFullname);
    await storage.write(key: _userBirthday, value: user.userBirthday);
    await storage.write(key: _userGender, value: user.userGender.toString());
    await storage.write(key: _userProfile, value: user.userProfile);
  }

  Future<String> getUserFullname() async {
    final storage = FlutterSecureStorage();
    String? userFullname = await storage.read(key: _userFullname);
    return userFullname ?? '';
  }

  Future<String> getUserBirthday() async {
    final storage = FlutterSecureStorage();
    String? userBirthday = await storage.read(key: _userBirthday);
    return userBirthday ?? '';
  }

  Future<String> getUserId() async {
    final storage = FlutterSecureStorage();
    String? id = await storage.read(key: _id);
    return id ?? '';
  }

  Future<User> getUserData() async {
    final storage = FlutterSecureStorage();
    String? id = await storage.read(key: _id);
    String? email = await storage.read(key: _email);
    String? username = await storage.read(key: _username);
    String? userFullname = await storage.read(key: _userFullname);
    String? userBirthday = await storage.read(key: _userBirthday);
    String? userGender = await storage.read(key: _userGender);
    String? userProfile = await storage.read(key: _userProfile);
    return User(
      id: int.parse(id ?? _id.toString()),
      email: email ?? _email,
      username: username ?? _username,
      userFullname: userFullname ?? '',
      userBirthday: userBirthday ?? '',
      userGender: int.parse(userGender ?? '0'),
      userProfile: userProfile ?? '',
    );
  }
}
