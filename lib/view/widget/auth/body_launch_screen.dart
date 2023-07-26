import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/auth/launch_controller.dart';
import 'package:world_peace/core/constant/color.dart';

import '../../../core/constant/image.dart';

class BodyLaunch extends StatelessWidget {
  const BodyLaunch({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LaunchController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(
              top: 114.h,
            ),
            child: Center(
              child: Image(
                image: const AssetImage(ImageUrl.world),
                width: 340.w,
                height: 338.h,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Text("AqsaCommunity",
              style: GoogleFonts.ubuntu(fontSize: 25.sp, height: 1.h)),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Post what you want, talk to friends,\n message them,  create new relationships,\n and more in this community",
            style: GoogleFonts.ubuntu(
                fontSize: 15.sp, color: Colors.grey, height: 1.5.h),
            textAlign: TextAlign.center,
          ),
          Stack(children: [
            Container(
              margin: EdgeInsets.only(top: 60.h, right: 20.w, left: 20.w),
              padding: EdgeInsets.only(left: 170.w),
              width: double.infinity,
              height: 65.h,
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: TextButton(
                onPressed: () {
                  controller.goToSignUp();
                },
                child: Text(
                  "Sign up",
                  style:
                      GoogleFonts.ubuntu(color: Colors.black, fontSize: 17.sp),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60.h, right: 20.w, left: 20.w),
              padding: EdgeInsets.only(left: 10.w),
              width: 180.w,
              height: 65.h,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: TextButton(
                onPressed: () {
                  controller.goToSignIn();
                },
                child: Text(
                  "Sign in",
                  style:
                      GoogleFonts.ubuntu(color: Colors.white, fontSize: 17.sp),
                ),
              ),
            ),
          ]),
        ]),
      );
    });
  }
}
