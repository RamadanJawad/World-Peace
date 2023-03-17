import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/auth/launch_controller.dart';

import '../../../core/constant/image.dart';

class BodyLaunch extends StatelessWidget {
  const BodyLaunch({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LaunchController>(builder: (controller) {
      return Column(children: [
        Container(
          margin: EdgeInsets.only(
            // left: 27.w,
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
        Text("WORLD PEACE",
            style: GoogleFonts.cairo(fontSize: 25.sp, height: 1.h)),
        Text("Retrain the brain",
            style: GoogleFonts.cairo(fontSize: 15.sp, height: 1.5.h)),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed do eiusmod Lorem\n ipsum dolor sit amet, consectetur",
          style: GoogleFonts.cairo(
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
              color: Color(0xffA0C364).withOpacity(0.3),
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: TextButton(
              onPressed: () {
                controller.goToSignUp();
              },
              child: Text(
                "Sign up",
                style: GoogleFonts.cairo(color: Colors.black),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60.h, right: 20.w, left: 20.w),
            padding: EdgeInsets.only(left: 10.w),
            width: 180.w,
            height: 65.h,
            decoration: BoxDecoration(
              color: Color(0xffA0C364),
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: TextButton(
              onPressed: () {
                controller.goToSignIn();
              },
              child: Text(
                "Sign in",
                style: GoogleFonts.cairo(color: Colors.white),
              ),
            ),
          ),
        ]),
      ]);
    });
  }
}
