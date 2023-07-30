import 'package:get/get.dart';
import 'package:world_peace/features/auth/view/screen/login_screen.dart';

import '../../auth/view/screen/register_screen.dart';

class LaunchController extends GetxController {
  void goToSignIn() {
    Get.to(() => const LoginScreen(), transition: Transition.fade);
  }

  void goToSignUp() {
    Get.to(() => const RegisterScreen(), transition: Transition.fade);
  }
}
