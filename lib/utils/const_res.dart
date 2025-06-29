import 'package:intelligent_parking_management_with_ai/data/user_data.dart';

class ConstRes {
  /* Urls backend */
  static const String baseUrl = 'http://119.59.102.201:8000/';
  static const String secureUrl = '${baseUrl}secure/';
  static final String id = '${UserData().id}';

  /* Urls websocket */
  static const String webSocketUrl = 'ws://119.59.102.201:3000/ws/';

  /* Urls spot service */
  static const String spotServiceUrl = 'http://119.59.102.201:8089/';
}
