import 'package:get/get.dart';

import '../models/image_model.dart';

class ImageProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.leviathanbolu.my.id/api';
  }

  Future<ImageModel?> getImage() async {
    final response = await get('/image');
    if (response.body is Map<String, dynamic>) {
      final data = response.body['data'];
      if (data is Map<String, dynamic>) return ImageModel.fromJson(data);
    }
    return null;
  }

  Future<Response> postImage(ImageModel image) async => await post('image', image.toJson());
  Future<Response> deleteImage(int id) async => await delete('image/$id');
}
