import 'package:intelligent_parking_management_with_ai/models/user_model.dart';
import 'package:intelligent_parking_management_with_ai/services/user_api.dart';
import 'package:intelligent_parking_management_with_ai/utils/Pref_res.dart';
import 'package:intelligent_parking_management_with_ai/utils/token_res.dart';

class ApiHandles {
  PrefRes prefRes = PrefRes();
  TokenStorageService tokenStorageService = TokenStorageService();
  // Handle Change Username
  Future<int> changeUsername(User user) async {
    // Implement the logic to change the username
    // This could involve making an API call to update the username in the backend
    String userId = await prefRes.getUserId();
    print('User ID: $userId');
    String token = await tokenStorageService.getToken() ?? '';
    print('Token: $token');

    int result =
        await UserApi.UpdateUsernameAPI(userId, user, token).then((value) {
      if (value[0].id.toString() == userId) {
        // Update the local user data if the update was successful
        prefRes.setUserData(value[0]);
        return 1; // Indicating success
      } else {
        // Handle the case where the update was not successful
        print('Failed to update username: ${value[0].message}');
        return 0; // Indicating failure
      }
    });
    return result;
  }

  // Handle Change Email
  Future<int> changeEmail(User user) async {
    // Implement the logic to change the email
    // This could involve making an API call to update the email in the backend
    String userId = await prefRes.getUserId();
    String token = await tokenStorageService.getToken().toString();

    int result =
        await UserApi.UpdateEmailAPI(userId, user, token).then((value) {
      if (value[0].id.toString() == userId) {
        // Update the local user data if the update was successful
        prefRes.setUserData(value[0]);
        return 1; // Indicating success
      } else {
        // Handle the case where the update was not successful
        print('Failed to update email: ${value[0].message}');
        return 0; // Indicating failure
      }
    });
    return result;
  }

  // Handle Change Password
  Future<int> changePassword(User user) async {
    // Implement the logic to change the email
    // This could involve making an API call to update the email in the backend
    String userId = await prefRes.getUserId();
    String token = await tokenStorageService.getToken().toString();

    int result =
        await UserApi.UpdatePasswordAPI(userId, user, token).then((value) {
      if (value[0].id.toString() == userId) {
        // Update the local user data if the update was successful
        prefRes.setUserData(value[0]);
        return 1; // Indicating success
      } else {
        // Handle the case where the update was not successful
        print('Failed to update password: ${value[0].message}');
        return 0; // Indicating failure
      }
    });
    return result;
  }

  // Handle Change Info
  Future<int> changeInfo(User user) async {
    // Implement the logic to change the email
    // This could involve making an API call to update the email in the backend
    String userId = await prefRes.getUserId();
    String token = await tokenStorageService.getToken().toString();

    int result = await UserApi.UpdateInfoAPI(userId, user, token).then((value) {
      if (value[0].id.toString() == userId) {
        // Update the local user data if the update was successful
        prefRes.setUserData(value[0]);
        return 1; // Indicating success
      } else {
        // Handle the case where the update was not successful
        print('Failed to update email: ${value[0].message}');
        return 0; // Indicating failure
      }
    });
    return result;
  }
}
