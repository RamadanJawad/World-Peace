import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_auth.dart';
import '../view/screen/login_screen.dart';

class SignUpController extends GetxController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController mobile;
  late TextEditingController password;
  GlobalKey<FormState> globalKey = GlobalKey();

  Future register() async {
    Get.dialog(const Center(
      child: CupertinoActivityIndicator(
        radius: 20,
        color: Colors.white,
      ),
    ));
    bool? response = await ApiAuthController().register(
      name: username.text,
      email: email.text,
      password: password.text,
      mobile: mobile.text,
    );
    if (response!) {
      Get.snackbar("Created Account!",
          "The account has been created successfully, login now",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.thumb_up_alt_rounded,
            color: Colors.white,
          ));
      Get.off(() => const LoginScreen());
    } else {
      Get.snackbar(
          "Error of Create Account", "Create Account failed , please try again",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ));
      Get.back();
      update();
    }
  }

  bool show_pass = true;
  void goToSignIn() {
    Get.off(() => const LoginScreen(), transition: Transition.fade);
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
