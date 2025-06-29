// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';
import 'package:intelligent_parking_management_with_ai/utils/format_res.dart';

class NotifyRes {
  static void showPasswordInvalid(String password) {
    // check Password is valid or not
    if (!CheckFormatRes.isPasswordValid(password)) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'WARNING',
          'Please enter a valid password',
          snackPosition: SnackPosition.TOP,
          backgroundColor: ColorRes.redColor,
          colorText: ColorRes.whiteColor,
          duration: Duration(
            milliseconds: 1000,
          ),
        );
      }
    }
  }

  static void showEmailInvalid(String email) {
    // check Email is valid or not
    if (!CheckFormatRes.isEmailValid(email)) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'WARNING',
          'Please enter a valid email',
          snackPosition: SnackPosition.TOP,
          backgroundColor: ColorRes.redColor,
          colorText: ColorRes.whiteColor,
          duration: Duration(
            milliseconds: 1000,
          ),
        );
      }
    }
  }

  static void showUsernameInvalid(String username) {
    // check Username is valid or not
    if (!CheckFormatRes.isUsernameValid(username)) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'WARNING',
          'Please enter a valid username',
          snackPosition: SnackPosition.TOP,
          backgroundColor: ColorRes.redColor,
          colorText: ColorRes.whiteColor,
          duration: Duration(
            milliseconds: 1000,
          ),
        );
      }
    }
  }

  static void showEmailEmpty(String email) {
    if (email.isEmpty) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'WARNING',
          'Please enter your email',
          snackPosition: SnackPosition.TOP,
          backgroundColor: ColorRes.redColor,
          colorText: ColorRes.whiteColor,
          duration: Duration(
            milliseconds: 1000,
          ),
        );
      }
    }
  }

  static void showPasswordEmpty(String password) {
    if (password.isEmpty) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'WARNING',
          'Please enter your password',
          snackPosition: SnackPosition.TOP,
          backgroundColor: ColorRes.redColor,
          colorText: ColorRes.whiteColor,
          duration: Duration(
            milliseconds: 1000,
          ),
        );
      }
    }
  }

  static void showUsernameEmpty(String username) {
    if (username.isEmpty) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'WARNING',
          'Please enter your username',
          snackPosition: SnackPosition.TOP,
          backgroundColor: ColorRes.redColor,
          colorText: ColorRes.whiteColor,
          duration: Duration(
            milliseconds: 1000,
          ),
        );
      }
    }
  }

  static void showPasswordsNotMatch(String password, String confirmPassword) {
    // check Password and Confirm Password is match or not
    if (password != confirmPassword) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'WARNING',
          'Passwords do not match',
          snackPosition: SnackPosition.TOP,
          backgroundColor: ColorRes.redColor,
          colorText: ColorRes.whiteColor,
          duration: Duration(
            milliseconds: 1000,
          ),
        );
      }
    }
  }
}
