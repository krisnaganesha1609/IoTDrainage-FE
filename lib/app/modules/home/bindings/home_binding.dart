import 'package:get/get.dart';

import '../../../data/providers/image_provider.dart';
import '../../../services/websocket_service.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageProvider>(() => ImageProvider());
    Get.put<WebSocketService>(WebSocketService());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
