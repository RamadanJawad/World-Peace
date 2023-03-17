import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/controller/util/main_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());
    return Scaffold(
        body: Obx(
          () => IndexedStack(
              index: controller.index.value, children: controller.screens),
        ),
        bottomNavigationBar: Obx(
          () => CustomNavigationBar(
              iconSize: 27,
              items: [
                CustomNavigationBarItem(
                  icon: ImageIcon(AssetImage(ImageUrl.home)),
                ),
                CustomNavigationBarItem(
                  icon: ImageIcon(AssetImage(ImageUrl.chat)),
                ),
                CustomNavigationBarItem(
                    icon: ImageIcon(
                  AssetImage(ImageUrl.add),
                )),
                CustomNavigationBarItem(
                  icon: ImageIcon(AssetImage(ImageUrl.notification)),
                ),
                CustomNavigationBarItem(
                  icon: ImageIcon(AssetImage(ImageUrl.profile)),
                ),
              ],
              selectedColor: AppColor.primaryColor,
              unSelectedColor: Colors.grey,
              borderRadius: Radius.circular(10).r,
              currentIndex: controller.index.value,
              strokeColor: AppColor.primaryColor,
              onTap: (val) {
                controller.onTap(val);
                // if (controller.index.value == 2) {
                //   alertDialog();
                // }
              }),
        ));
  }
}
