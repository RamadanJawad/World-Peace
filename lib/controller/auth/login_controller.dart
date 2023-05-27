import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_auth.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/model/user.dart';
import 'package:world_peace/view/screen/bottom/main_screen.dart';
import '../../view/screen/auth/forget_pass_screen.dart';
import '../../view/screen/auth/register_screen.dart';

class SignInController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> globalKey = GlobalKey();
  bool show_pass = true;
  Future login() async {
    User? user = await ApiAuthController()
        .login(email: email.text, password: password.text);
    if (user != null) {
      AppPreferences().save(user);
      Future.delayed(const Duration(seconds: 3), () {
        Get.off(() => const MainScreen());
      });
    } else {
      Get.snackbar("Error of Login", "login failed , please try again");
    }
    Get.delete();
  }

  void goToForgetPassword() {
    Get.off(() => const ForgetPassScreen(), transition: Transition.fade);
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
