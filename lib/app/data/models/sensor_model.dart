class SensorModel {
  String? timestamp;
  String? deviceId;
  num? waterDistance;
  num? waterLevelCm;
  String? status;
  bool? rainDetected;
  String? sensorFlag;
  num? nextWakeupSec;

  SensorModel({
    this.timestamp,
    this.deviceId,
    this.waterDistance,
    this.waterLevelCm,
    this.status,
    this.rainDetected,
    this.sensorFlag,
    this.nextWakeupSec,
  });

  SensorModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    deviceId = json['device_id'];
    waterDistance = json['water_distance'] as num?;
    waterLevelCm = json['water_level_cm'] as num?;
    status = json['status'];
    rainDetected = json['rain_detected'] as bool?;
    sensorFlag = json['sensor_flag'];
    nextWakeupSec = json['next_wakeup_sec'] as num?;
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp,
      'device_id': deviceId,
      'water_distance': waterDistance,
      'water_level_cm': waterLevelCm,
      'status': status,
      'rain_detected': rainDetected,
      'sensor_flag': sensorFlag,
      'next_wakeup_sec': nextWakeupSec,
    };
  }
}
