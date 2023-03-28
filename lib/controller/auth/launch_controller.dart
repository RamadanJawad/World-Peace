import 'package:get/get.dart';
import 'package:world_peace/view/screen/auth/login_screen.dart';

import '../../view/screen/auth/register_screen.dart';

class LaunchController extends GetxController {
  void goToSignIn() {
    Get.to(() => const SignIn(), transition: Transition.fade);
  }

  void goToSignUp() {
    Get.to(() => const SignUp(), transition: Transition.fade);
  }
}
