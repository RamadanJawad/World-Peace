import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/view/screen/auth/launchScreen.dart';
import 'package:world_peace/view/screen/auth/signIn.dart';
class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  );

  late CurvedAnimation curve =
      CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn);

  @override
  void onInit() {
    controller.forward();
    update();
    super.onInit();
    Future.delayed(Duration(seconds: 5), () {
      Get.off(() => const LaunchScreen());
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
