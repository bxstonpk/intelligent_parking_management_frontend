// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, unnecessary_string_interpolations, must_be_immutable

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intelligent_parking_management_with_ai/common/button_api.dart';
import 'package:intelligent_parking_management_with_ai/services/web_socket_service.dart';
import 'package:intelligent_parking_management_with_ai/utils/color_res.dart';
import 'package:intelligent_parking_management_with_ai/utils/urls.dart';
// import 'dart:convert'; // Uncomment นี้ถ้าข้อมูลที่รับมาเป็น JSON

class StreamUI extends StatefulWidget {
  String id;
  StreamUI({super.key, required this.id});

  @override
  State<StreamUI> createState() => _StreamUIState();
}

class _StreamUIState extends State<StreamUI> {
  late final WebSocketService _webSocket;
  String base64String = '';
  String _currentStreamCameraId = ''; // เพื่อเก็บว่ากำลังสตรีมจากกล้องตัวไหน
  Uint8List? _liveImageBytes;
  String _statusMessage = ''; // เพิ่มตัวแปรสำหรับเก็บข้อความสถานะ

  @override
  void initState() {
    super.initState();
    if (widget.id == '1') {
      _webSocket = WebSocketService(Urls.camera1StreamUrl);
    } else {
      _webSocket = WebSocketService(Urls.camera2StreamUrl);
    }

    _webSocket.stream?.listen(
      (message) {
        if (mounted) {
          setState(() {
            if (message is List<int>) {
              // ถ้าเป็นข้อมูลไบนารี (เช่น รูปภาพ JPEG)
              _liveImageBytes = Uint8List.fromList(message);
              _statusMessage = 'Receiving image stream...';
            } else if (message is String) {
              // ถ้าเป็นข้อความ (เช่น คำสั่ง, ข้อผิดพลาด, หรือ JSON)
              // คุณอาจจะต้องลองแปลงเป็น JSON ถ้าคาดหวัง
              // try {
              //   final data = jsonDecode(message);
              //   _statusMessage = 'Received from Camera ${data['cameraId'] ?? ''}: ${data['status'] ?? message}';
              //   // ถ้า server ส่ง URL ของ video stream มา คุณสามารถอัปเดต state เพื่อแสดงวิดีโอได้
              //   // เช่น if (data['videoUrl'] != null) _videoUrl = data['videoUrl'];
              // } catch (e) {
              //   _statusMessage = 'Received text: $message';
              // }
              _statusMessage = 'Received text: $message';
              _liveImageBytes = null; // เคลียร์รูปภาพถ้าได้รับข้อความ
            } else {
              _statusMessage =
                  'Received unknown data type: ${message.runtimeType}';
              _liveImageBytes = null;
            }
          });
        }
      },
      onError: (error) {
        if (mounted) {
          setState(() {
            base64String = 'Error: $error';
          });
        }
      },
      onDone: () {
        if (mounted) {
          setState(() {
            base64String = 'Connection closed.';
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _webSocket.close();
    super.dispose();
  }

  // Method สำหรับส่งคำสั่งควบคุมกล้อง
  void _sendCameraCommand(String command, String cameraId) {
    _webSocket.sendMessage({
      "command": command,
      "cameraId": cameraId,
    });
    if (command == 'open') {
      setState(() {
        _currentStreamCameraId = cameraId;
      });
    } else if (command == 'close' && _currentStreamCameraId == cameraId) {
      setState(() {
        _currentStreamCameraId = '';
        base64String =
            'Live data will be displayed here.'; // รีเซ็ตข้อความเมื่อปิดกล้อง
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Parking Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorRes.backColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.08,
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Parking Spot Stream',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorRes.greyColor,
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.07,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // แสดงข้อมูลหรือภาพ/วิดีโอจาก Stream
                          _liveImageBytes != null
                              ? Image.memory(_liveImageBytes!)
                              : Text(
                                  base64String.isNotEmpty
                                      ? base64String
                                      : 'Live data will be displayed here.',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                          if (_currentStreamCameraId.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Streaming from: $_currentStreamCameraId',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          // ตรงนี้คือที่ที่คุณจะใส่ Widget แสดงวิดีโอสตรีมจริง ๆ
                          // เช่น Image.network(imageUrl) หรือ VideoPlayer
                          // (คุณจะต้อง implement logic การรับ URL ของวิดีโอจาก WebSocket และใช้แพ็กเกจวิดีโอ)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
