import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/view/screen/bottom/main_screen.dart';
import '../../view/screen/auth/signIn.dart';
import '../../view/screen/bottom/home_screen.dart';

class SignUpController extends GetxController {
  late TextEditingController username;
  late TextEditingController confirmPassword;
  late TextEditingController email;
  GlobalKey<FormState> globalKey = GlobalKey();
  late TextEditingController password;

  bool show_pass = true;
  bool show_confirm_pass = true;
  void goToSignIn() {
    Get.to(() => SignIn(), transition: Transition.fade);
  }

  showPassword() {
    show_pass = show_pass == true ? false : true;
    update();
  }

  showConfirmPassword() {
    show_confirm_pass = show_confirm_pass == true ? false : true;
    update();
  }

  void goToHome() {
    Get.off(() => const MainScreen(), transition: Transition.fade);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
    username.dispose();
    confirmPassword.dispose();
  }
}
