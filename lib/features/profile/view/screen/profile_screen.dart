import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/features/profile/controller/profile_controller.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/features/chat/view/screen/messages_screen.dart';
import 'package:world_peace/features/profile/view/widget/body_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            elevation: 0,
            actions: [
              controller.profile.friend == 1
                  ? IconButton(
                      onPressed: () {
                        CacheData().setUserName(controller.profile.user!.name!);
                        Get.off(() => const MessagesScreen(),
                            transition: Transition.fade);
                      },
                      icon: const Icon(CupertinoIcons.chat_bubble_text_fill))
                  : Container()
            ],
          ),
          body: const BodyProfile(),
        );
      },
    );
  }
}
