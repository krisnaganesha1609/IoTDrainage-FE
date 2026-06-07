import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background message
}

class FcmService extends GetxService {
  final _messaging = FirebaseMessaging.instance;

  Future<FcmService> init() async {
    await _requestPermission();
    await _getToken();
    _listenForeground();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    return this;
  }

  Future<void> _requestPermission() async {
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> _getToken() async {
    final token = await _messaging.getToken();
    debugPrint('FCM Token: $token');
  }

  void _listenForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      if (notification != null) {
        debugPrint('Foreground: ${notification.title} - ${notification.body}');
      }
    });
  }
}
