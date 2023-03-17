import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/bottom/home_screen.dart';

class ForgetPassController extends GetxController {
  late TextEditingController email;
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
  }

  void goToHome() {
    Get.to(() => const HomeScreen(), transition: Transition.fade);
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
  }
}
