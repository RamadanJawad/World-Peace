import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:world_peace/view/screen/bottom/chat_screen.dart';
import 'package:world_peace/view/screen/bottom/home_screen.dart';
import 'package:world_peace/view/screen/bottom/notification_screen.dart';
import 'package:world_peace/view/screen/bottom/post_screen.dart';
import 'package:world_peace/view/screen/bottom/profile_screen.dart';

class MainController extends GetxController {
  RxInt index = 0.obs;
  void onTap(int val) {
    index.value = val;
  }

  List<Widget> screens = [
    HomeScreen(),
    ChatScreen(),
    PostScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
