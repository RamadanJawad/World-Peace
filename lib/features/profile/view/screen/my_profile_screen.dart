import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/features/profile/controller/my_profile_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/features/profile/view/widget/body_my_profile.dart';
import 'package:world_peace/features/profile/view/widget/custom_setting.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfileController>(
      init: MyProfileController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            elevation: 0,
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  child: showCustomPopMenu(
                    onSelected: (select) => controller.onSelected(select),
                  ),
                ),
              )
            ],
          ),
          body: const BodyMyProfile(),
        );
      },
    );
  }
}
