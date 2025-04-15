// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

// Storage class to manage user data
class UserData extends GetxController {
  // User properties
  var _id = 0.obs;
  var _email = ''.obs;
  var _username = ''.obs;
  var userFullname = ''.obs;
  var userBirthday = ''.obs;
  var userGender = 0.obs;
  RxString userProfile = ''.obs;
  RxString userProfileSelect = ''.obs;

  // Setters private data
  void setId(int id) => _id.value = id;
  void setEmail(String email) => _email.value = email;
  void setUsername(String username) => _username.value = username;

  // Getters private data
  int get id => _id.value;
  String get email => _email.value;
  String get username => _username.value;
}
