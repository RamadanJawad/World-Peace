import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_auth.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/features/auth/model/user.dart';
import 'package:world_peace/features/main/view/main_screen.dart';
import '../view/screen/register_screen.dart';

class SignInController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> globalKey = GlobalKey();
  bool show_pass = true;
  Future login() async {
    Get.dialog(const Center(
      child: CupertinoActivityIndicator(
        radius: 20,
        color: Colors.white,
      ),
    ));
    User? user = await ApiAuthController()
        .login(email: email.text, password: password.text);
    if (user != null) {
      AppPreferences().save(user);
      Future.delayed(const Duration(seconds: 3), () {
        Get.off(() => const MainScreen());
      });
    } else {
      Get.snackbar("Error of Login", "login failed , please try again",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.thumb_up_off_alt_rounded,
            color: Colors.white,
          ));
      Get.back();
      update();
    }
    update();
  }

  void goToSignUp() {
    Get.off(() => const RegisterScreen(), transition: Transition.fade);
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
