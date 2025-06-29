// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:intelligent_parking_management_with_ai/models/spot_model.dart';
import 'package:intelligent_parking_management_with_ai/utils/urls.dart';
import 'package:http/http.dart' as http;

class SpotApi {
  final String cameraId;

  SpotApi(this.cameraId);

  static Future<SpotModel> getLatestSpots(String cameraId) async {
    final responseData = await http.get(
      Uri.parse(Urls.getSpotUrl(cameraId)),
      headers: {'Content-Type': 'application/json'},
    );

    if (responseData.statusCode == 200) {
      final decodedData = jsonDecode(responseData.body);

      if (decodedData is Map<String, dynamic>) {
        return SpotModel.fromJson(decodedData);
      } else {
        throw Exception(
            'Expected a Map<String, dynamic> but got: $decodedData');
      }
    } else {
      throw Exception('Failed to load spots: ${responseData.statusCode}');
    }
  }
}
