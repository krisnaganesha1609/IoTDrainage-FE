import 'dart:async';

import 'package:get/get.dart';

import '../../../data/providers/image_provider.dart';
import '../../../services/websocket_service.dart';

class HomeController extends GetxController {
  final _imageProvider = Get.find<ImageProvider>();
  final _wsService = Get.find<WebSocketService>();

  final imageUrl = RxnString();
  final imageTimestamp = RxnString();
  final sensorStatus = RxnString();

  StreamSubscription? _wsSub;

  @override
  void onInit() {
    super.onInit();
    fetchImage();
    _wsSub = _wsService.stream.listen((data) {
      sensorStatus.value = data['status'] as String?;
      fetchImage();
    });
  }

  @override
  void onClose() {
    _wsSub?.cancel();
    super.onClose();
  }

  Future<void> fetchImage() async {
    final image = await _imageProvider.getImage();
    imageUrl.value = image?.url;
    imageTimestamp.value = _formatTimestamp(image?.lastUpdated);
  }

  String? _formatTimestamp(num? timestamp) {
    if (timestamp == null) return null;
    final ms = timestamp > 1e10 ? timestamp.toInt() : timestamp.toInt() * 1000;
    final dt = DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true).toLocal();
    const months = [
      '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
    ];
    final hour = dt.hour.toString().padLeft(2, '0');
    final minute = dt.minute.toString().padLeft(2, '0');
    return 'Diperbarui ${dt.day} ${months[dt.month]} ${dt.year}, $hour.$minute';
  }
}
