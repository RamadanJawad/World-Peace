import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/view/screen/bottom/main_screen.dart';

import '../../view/screen/auth/ForgetPassScreen.dart';
import '../../view/screen/auth/signUp.dart';
import '../../view/screen/bottom/home_screen.dart';

class SignInController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> globalKey = GlobalKey();
  bool show_pass = true;

  void goToForgetPassword() {
    Get.to(() => ForgetPassScreen(), transition: Transition.fade);
  }

  void goToSignUp() {
    Get.to(() => SignUp(), transition: Transition.fade);
  }

  void goToHome() {
    Get.off(() => const MainScreen(), transition: Transition.fade);
  }

  showPassword() {
    show_pass = show_pass == true ? false : true;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }
}
