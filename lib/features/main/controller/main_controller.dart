import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:world_peace/features/chat/view/screen/chat_screen.dart';
import 'package:world_peace/features/home/view/screen/home_screen.dart';
import 'package:world_peace/features/profile/view/screen/my_profile_screen.dart';
import 'package:world_peace/features/notifications/view/screen/notification_screen.dart';
import 'package:world_peace/features/post/view/screen/post_screen.dart';

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
