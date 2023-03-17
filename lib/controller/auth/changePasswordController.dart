import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/bottom/home_screen.dart';

class ChangePasswordController extends GetxController {
  late TextEditingController currentPassword;
  late TextEditingController newPassword;
  late TextEditingController repeaPassword;

  GlobalKey<FormState> globalKey = GlobalKey();

  void goToHome() {
    Get.to(() => const HomeScreen(), transition: Transition.fade);
  }

  @override
  void onInit() {
    super.onInit();
    currentPassword = TextEditingController();
    newPassword = TextEditingController();
    repeaPassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    currentPassword.dispose();
    newPassword.dispose();
    repeaPassword.dispose();
  }
}
