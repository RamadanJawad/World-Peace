import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_auth.dart';
import 'package:world_peace/model/user.dart';
import 'package:world_peace/view/screen/bottom/main_screen.dart';
import '../../view/screen/auth/login_screen.dart';

class SignUpController extends GetxController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController mobile;
  late TextEditingController password;
  GlobalKey<FormState> globalKey = GlobalKey();

  Future register() async {
    User? user = await ApiAuthController().register(
      name: username.text,
      email: email.text,
      password: password.text,
      mobile: mobile.text,
    );
    if (user != null) {
      Get.snackbar("Created Account!",
          "The account has been created successfully, login now",
          backgroundColor: Colors.green);
      Get.off(() => const LoginScreen());
    } else {
      Get.snackbar("Error of Login", "login failed , please try again",
          backgroundColor: Colors.red);
    }
  }

  bool show_pass = true;
  void goToSignIn() {
    Get.off(() => LoginScreen(), transition: Transition.fade);
  }

  showPassword() {
    show_pass = show_pass == true ? false : true;
    update();
  }

  void goToHome() {
    Get.off(() => const MainScreen(), transition: Transition.fade);
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    mobile = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    username.dispose();
    mobile.dispose();
  }
}