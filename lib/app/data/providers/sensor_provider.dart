import 'package:get/get.dart';

import '../models/sensor_model.dart';

class SensorProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return SensorModel.fromJson(map);
      if (map is List) {
        return map.map((item) => SensorModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'https://api.leviathanbolu.my.id/api';
  }

  Future<List<SensorModel>?> getLatest(String deviceId) async {
    final response = await get('sensor/latest/$deviceId');
    if (response.body is Map<String, dynamic>) {
      final data = response.body['data'] as List?;
      return data?.map((e) => SensorModel.fromJson(e)).toList();
    }
    return null;
  }
}
