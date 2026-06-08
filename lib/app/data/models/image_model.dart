class ImageModel {
  String? url;
  num? lastUpdated;

  ImageModel({
    this.url,
    this.lastUpdated,
  });

  ImageModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    lastUpdated = json['last_updated'] as num?;
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'last_updated': lastUpdated,
    };
  }
}
