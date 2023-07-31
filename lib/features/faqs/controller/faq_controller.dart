import 'package:get/get.dart';

class FAQController extends GetxController {
  bool isTapped = false;
  bool isTapped1 = false;
  bool isTapped2 = false;
  bool isTapped3 = false;
  bool isTapped4 = false;
  bool isTapped5 = false;

  isTapController() {
    isTapped = !isTapped;
    update();
  }
  isTapController1() {
    isTapped1 = !isTapped1;
    update();
  }
  isTapController2() {
    isTapped2 = !isTapped2;
    update();
  }
  isTapController3() {
    isTapped3 = !isTapped3;
    update();
  }
  isTapController4() {
    isTapped4 = !isTapped4;
    update();
  }

}
