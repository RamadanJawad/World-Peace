import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:world_peace/controller/util/main_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());
    return PersistentTabView(
      context,
      controller: controller.persistentTabController,
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      navBarStyle: NavBarStyle.style18,
      confineInSafeArea: true,
      screens: controller.screens,
      hideNavigationBar: false,
      items: [
        PersistentBottomNavBarItem(
          icon: const ImageIcon(AssetImage(ImageUrl.home)),
          textStyle: GoogleFonts.ubuntu(),
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const ImageIcon(AssetImage(ImageUrl.chat)),
          textStyle: GoogleFonts.ubuntu(),
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          textStyle: GoogleFonts.ubuntu(),
          activeColorSecondary: Colors.white,
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const ImageIcon(
            AssetImage(ImageUrl.notification),
          ),
          textStyle: GoogleFonts.ubuntu(),
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const ImageIcon(AssetImage(ImageUrl.profile)),
          textStyle: GoogleFonts.ubuntu(),
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ],
    );
  }
}
