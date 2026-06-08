import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/services/fcm_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Get.putAsync(() => FcmService().init());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "IoTDrainage",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
