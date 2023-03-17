import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:world_peace/controller/auth/ForgetPassController.dart';
import 'package:world_peace/view/widget/auth/BodyForgetPassword.dart';

import '../../../core/constant/color.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPassController controller = Get.put(ForgetPassController());

    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0,
          iconTheme: const IconThemeData.fallback(),
        ),
        body: const BodyForgetPassword());
  }
}
