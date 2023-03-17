import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/constant/color.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColor.primaryColor.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
        elevation: 0,
        title: Text(
          "Notifications",
          style: GoogleFonts.cairo(fontSize: 20.sp, color: Colors.black),
        ),
      ),
      body: Container(
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(controller.data[index]['icon']),
                    radius: 26.r,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.data[index]['name'],
                        style: GoogleFonts.cairo(fontSize: 17.sp),
                      ),
                      Text(
                        "commented on your post",
                        style: GoogleFonts.cairo(
                            fontSize: 15.sp, color: Colors.grey),
                      )
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
