import 'package:intelligent_parking_management_with_ai/data/user_data.dart';

class ConstRes {
  /* Urls backend */
  static const String baseUrl = 'http://localhost:8081/';
  static const String secureUrl = '${baseUrl}secure';
  static final String id = '${UserData().id}';
}
