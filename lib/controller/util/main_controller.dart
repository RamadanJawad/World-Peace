import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:world_peace/view/screen/bottom/chat_screen.dart';
import 'package:world_peace/view/screen/bottom/home_screen.dart';
import 'package:world_peace/view/screen/bottom/myProfile_screen.dart';
import 'package:world_peace/view/screen/bottom/notification_screen.dart';
import 'package:world_peace/view/screen/bottom/post_screen.dart';

class MainController extends GetxController {
  PersistentTabController persistentTabController=PersistentTabController(initialIndex: 0) ;

  List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const PostScreen(),
    const NotificationScreen(),
    const MyProfileScreen(),
  ];
}
