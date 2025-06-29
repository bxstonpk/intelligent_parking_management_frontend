import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert'; // เพิ่ม import สำหรับ jsonEncode

class WebSocketService {
  final String url;
  WebSocketChannel? _channel;
  Stream<dynamic>? _stream;

  WebSocketService(this.url) {
    _connect();
  }

  void _connect() {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _stream = _channel?.stream.asBroadcastStream();
      debugPrint('WebSocket connected to: $url');

      _stream?.listen(
        (message) {
          debugPrint('WebSocket received: $message');
        },
        onError: (error) {
          debugPrint('WebSocket error: $error');
        },
        onDone: () {
          debugPrint('WebSocket disconnected.');
        },
      );
    } catch (e) {
      debugPrint('Failed to connect WebSocket: $e');
    }
  }

  Stream<dynamic>? get stream => _stream;

  // ปรับปรุง method ให้รับ Map เพื่อส่งข้อมูล JSON
  void sendMessage(Map<String, dynamic> data) {
    if (_channel?.sink != null) {
      final String jsonString = jsonEncode(data); // แปลง Map เป็น JSON string
      _channel!.sink.add(jsonString);
      debugPrint('WebSocket sent: $jsonString');
    } else {
      debugPrint('WebSocket not connected. Cannot send command.');
    }
  }

  void close() {
    if (_channel?.sink != null) {
      _channel!.sink.close();
      debugPrint('WebSocket connection closed.');
    }
  }

  void reconnect() {
    close();
    _connect();
  }
}
