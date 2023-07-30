import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/features/auth/view/widget/body_login.dart';
import 'package:world_peace/features/launch/view/screen/launch_screen.dart';
import '../../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.off(const LaunchScreen(), transition: Transition.fade);
          },
        ),
        iconTheme: const IconThemeData.fallback(),
      ),
      body: const BodySignIn(),
    );
  }
}
