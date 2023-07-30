import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/features/auth/view/widget/body_register.dart';
import 'package:world_peace/features/launch/view/screen/launch_screen.dart';
import '../../controller/register_controller.dart';
import '../../../../core/constant/color.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
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
        body: const BodySignUp());
  }
}
