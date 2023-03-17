import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:world_peace/core/constant/color.dart';

import '../../../controller/auth/signIn_controller.dart';
import '../../widget/auth/bodySignIn.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController controller = Get.put(SignInController());

    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0,
          iconTheme: const IconThemeData.fallback(),
        ),
        body: const BodySignIn());
  }
}
