import 'package:get/get.dart';

import '../../core/app_constants.dart';

class FcmTokenProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = AppConstants.apiBaseUrl;
  }

  /// POST /api/register-token
  Future<bool> registerToken({
    required String deviceId,
    required String appInstanceId,
    required String fcmToken,
  }) async {
    final response = await post('/register-token', {
      'device_id': deviceId,
      'app_instance_id': appInstanceId,
      'fcm_token': fcmToken,
    });
    return response.isOk;
  }
}
