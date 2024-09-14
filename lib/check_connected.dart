import 'dart:async';
import 'dart:io';

class CheckConnected {
  final Duration checkInterval;
  StreamController<bool> _connectionStreamController;
  StreamSubscription? _connectionSubscription;

  CheckConnected({this.checkInterval = const Duration(seconds: 5)})
      : _connectionStreamController = StreamController<bool>.broadcast() {
    _startChecking();
  }

  // Getter สำหรับ stream ของสถานะการเชื่อมต่ออินเทอร์เน็ต
  Stream<bool> get connectionStream => _connectionStreamController.stream;

  void _startChecking() {
    _connectionSubscription = Stream.periodic(checkInterval).listen((_) async {
      bool isConnected = await _checkInternetConnection();
      _connectionStreamController.add(isConnected);
    });
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  void dispose() {
    _connectionSubscription?.cancel();
    _connectionStreamController.close();
  }
}
