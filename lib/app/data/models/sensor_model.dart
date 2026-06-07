class SensorModel {
  String? timestamp;
  num? waterDistance;
  bool? rainDetected;
  num? rainIntensity;

  SensorModel({
    this.timestamp,
    this.waterDistance,
    this.rainDetected,
    this.rainIntensity,
  });

  SensorModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    waterDistance = json['water_distance'] as num?;
    rainDetected = json['rain_detected'] as bool?;
    rainIntensity = json['rain_intensity'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['water_distance'] = waterDistance;
    data['rain_detected'] = rainDetected;
    data['rain_intensity'] = rainIntensity;
    return data;
  }
}
