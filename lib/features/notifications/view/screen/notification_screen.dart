import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/features/notifications/controller/notification_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/features/search/view/screen/search_by_user.dart';
import 'package:world_peace/features/notifications/view/widget/body_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
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
                Get.to(() => const SearchByUser());
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
