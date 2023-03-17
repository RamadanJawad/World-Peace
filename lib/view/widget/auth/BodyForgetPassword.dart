import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/auth/ForgetPassController.dart';
import 'package:world_peace/core/constant/image.dart';

import 'CustomButton.dart';
import 'CustomFiled .dart';

class BodyForgetPassword extends StatelessWidget {
  const BodyForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPassController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: Image.asset(
                      ImageUrl.logo,
                      width: 133.w,
                      height: 95.h,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Reset your password",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod",
                    style: GoogleFonts.cairo(fontSize: 15.sp, height: 1.h),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Form(
                      key: controller.globalKey,
                      child: Column(
                        children: [
                          CustomFiled(
                              controller: controller.email,
                              icon: Icons.email,
                              label: 'Email'),
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomButton(
                              name: "Send",
                              function: () {
                                controller.goToHome();
                              }),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
