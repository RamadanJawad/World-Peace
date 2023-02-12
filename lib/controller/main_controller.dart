import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainController extends GetxController {
  late PersistentTabController _controller;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _controller = PersistentTabController(initialIndex: 0);
  }
}
