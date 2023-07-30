import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/features/launch/view/widget/body_launch_screen.dart';
import '../../controller/launch_controller.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LaunchController());
    return const Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: BodyLaunch(),
    );
  }
}
