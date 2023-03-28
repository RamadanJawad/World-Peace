import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/view/screen/auth/launch_screen.dart';
import 'package:world_peace/view/screen/auth/login_screen.dart';
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
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() =>  LaunchScreen(),transition: Transition.fade);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
