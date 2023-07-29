import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/notification_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/view/screen/bottom/search_screen.dart';
import 'package:world_peace/view/screen/utils/search_user.dart';
import 'package:world_peace/view/widget/notification/body_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          title: Text(
            "Notifications",
            style: GoogleFonts.cairo(fontSize: 20.sp, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const SearchUser());
              },
              icon: const Icon(
                CupertinoIcons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: const BodyNotification());
  }
}

