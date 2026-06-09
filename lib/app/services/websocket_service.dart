import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService extends GetxService {
  static const _wsUrl = 'wss://api.leviathanbolu.my.id/ws';

  WebSocketChannel? _channel;
  final _streamController = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get stream => _streamController.stream;
  final isConnected = false.obs;

  bool _disposed = false;
  bool _connecting = false;

  @override
  void onInit() {
    super.onInit();
    _connect();
  }

  Future<void> _connect() async {
    if (_disposed || _connecting) return;
    _connecting = true;

    _channel?.sink.close();
    _channel = null;

    try {
      _channel = WebSocketChannel.connect(Uri.parse(_wsUrl));
      await _channel!.ready;
      isConnected.value = true;
      _connecting = false;

      _channel!.stream.listen(
        (event) {
          final data = jsonDecode(event as String);
          print(data);
          if (data is Map<String, dynamic>) {
            _streamController.add(data);
          }
        },
        onError: (e) {
          debugPrint('WebSocket error: $e');
          isConnected.value = false;
          _connecting = false;
          _reconnect();
        },
        onDone: () {
          debugPrint('WebSocket closed, reconnecting...');
          isConnected.value = false;
          _connecting = false;
          _reconnect();
        },
        cancelOnError: true,
      );
    } catch (e) {
      debugPrint('WebSocket connect failed: $e');
      _connecting = false;
      isConnected.value = false;
      _reconnect();
    }
  }

  void _reconnect() {
    if (_disposed) return;
    Future.delayed(const Duration(seconds: 5), _connect);
  }

  @override
  void onClose() {
    _disposed = true;
    _channel?.sink.close();
    _streamController.close();
    super.onClose();
  }
}
