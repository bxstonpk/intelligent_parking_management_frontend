// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

// Storage class to manage user data
class UserData extends GetxController {
  // User properties
  var _id = 0.obs;
  var _email = ''.obs;
  var _username = 'User name'.obs;
  var userFullname = 'User Fullname'.obs;
  var userBirthday = 'User Birthday'.obs;
  var userGender = 0.obs;
  RxString userProfile = 'User Profile'.obs;
  RxString userProfileSelect = 'User Profile Select'.obs;

  // Setters private data
  void setId(int id) => _id.value = id;
  void setEmail(String email) => _email.value = email;
  void setUsername(String username) => _username.value = username;
  void clearUserData() {
    _id.value = 0;
    _email.value = '';
    _username.value = 'User name';
    userFullname.value = 'User Fullname';
    userBirthday.value = 'User Birthday';
    userGender.value = 0;
    userProfile.value = 'User Profile';
    userProfileSelect.value = 'User Profile Select';
  }

  // Getters private data
  int get id => _id.value;
  String get email => _email.value;
  String get username => _username.value;
}
