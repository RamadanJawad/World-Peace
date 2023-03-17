import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/view/widget/auth/bodyLaunchScreen.dart';

import '../../../controller/auth/launch_controller.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LaunchController controller = Get.put(LaunchController());

    return const Scaffold(
        backgroundColor: AppColor.backgroundColor, body: BodyLaunch());
  }
}
