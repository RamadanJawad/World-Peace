
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/bottom/home_screen.dart';

class EditProfileController extends GetxController {
  late TextEditingController email;
  late TextEditingController name;
  GlobalKey<FormState> globalKey = GlobalKey();

  void goToHome() {
    Get.to(() => const HomeScreen(), transition: Transition.fade);
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    name = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    name.dispose();
  }
}
