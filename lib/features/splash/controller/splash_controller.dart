import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/features/launch/view/screen/launch_screen.dart';
import 'package:world_peace/features/main/view/main_screen.dart';

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
    Future.delayed(const Duration(seconds: 3), () {
      if (AppPreferences().loggedIn) {
        Get.off(() => const MainScreen(), transition: Transition.fade);
      } else {
        Get.off(() => const LaunchScreen(), transition: Transition.fade);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
