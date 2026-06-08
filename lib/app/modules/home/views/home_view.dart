import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iot_drainage/widgets/height_card.dart';
import 'package:iot_drainage/widgets/image_card.dart';
import 'package:iot_drainage/widgets/status_card.dart';
import 'package:iot_drainage/widgets/weather_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final isNormal = controller.sensorStatus.value == 'NORMAL' ||
            controller.sensorStatus.value == null;
        final primaryColor =
            isNormal ? const Color(0xFF47B881) : const Color(0xFFF64C4C);
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -1),
                  radius: 1.1,
                  colors: [primaryColor, const Color(0xFFFBFEFC)],
                  stops: const [0.1, 1.0],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                isNormal
                    ? 'assets/images/health_green.png'
                    : 'assets/images/health_red.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 67, left: 19, right: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Expanded(child: StatusCard()),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 198,
                      child: Row(
                        children: const [
                          Expanded(child: HeightCard(heightCm: 30)),
                          SizedBox(width: 6),
                          Expanded(child: WeatherCard()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 348,
                      child: Obx(
                        () => ImageCard(
                          imageUrl: controller.imageUrl.value,
                          timestamp: controller.imageTimestamp.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          ),
          ],
        );
      }),
    );
  }
}
