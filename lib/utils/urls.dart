import 'package:intelligent_parking_management_with_ai/utils/const_res.dart';

class Urls {
  /* This file is Urls backend */
  static const String loginUrl = '${ConstRes.baseUrl}login';
  static const String registerUrl = '${ConstRes.baseUrl}register';
  static const String getUserUrl = '${ConstRes.secureUrl}getuser/';
  static String updateInfoUrl(String userId) =>
      '${ConstRes.secureUrl}updateuser/$userId/info';
  static String updateEmailUrl(String userId) =>
      '${ConstRes.secureUrl}updateuser/$userId/email';
  static String updatePasswordUrl(String userId) =>
      '${ConstRes.secureUrl}updateuser/$userId/password';
  static String updateUsernameUrl(String userId) =>
      '${ConstRes.secureUrl}updateuser/$userId/username';

  /* This file is Urls websocket */
  static const String camera1StreamUrl = '${ConstRes.webSocketUrl}1';
  static const String camera2StreamUrl = '${ConstRes.webSocketUrl}2';

  /* This file is Urls spot service */
  static String getSpotUrl(String cameraId) =>
      '${ConstRes.spotServiceUrl}$cameraId/latest';
}
