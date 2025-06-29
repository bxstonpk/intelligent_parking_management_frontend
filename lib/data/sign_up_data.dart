import 'package:get/get.dart';

class SignUpData extends GetxController {
  // User properties
  var email = ''.obs;
  var password = ''.obs;
  var username = ''.obs;
  var userFullName = ''.obs;
  var userBirthday = ''.obs;
  var userGender = 0.obs;
  var userProfile = ''.obs;
  var userProfileSelect = ''.obs;

  // Setters for user data
  void clearSignUpData() {
    email.value = '';
    password.value = '';
    username.value = '';
    userFullName.value = '';
    userBirthday.value = '';
    userGender.value = 0;
    userProfile.value = '';
    userProfileSelect.value = '';
  }
}
