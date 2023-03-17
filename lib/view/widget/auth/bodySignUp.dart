import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';

import '../../../controller/auth/signIn_controller.dart';
import '../../../controller/auth/signUpController.dart';
import 'CustomButton.dart';
import 'CustomFiled .dart';
import 'CustomPassword.dart';

class BodySignUp extends StatelessWidget {
  const BodySignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let’s sign you up.",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold, fontSize: 25.sp),
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  Form(
                    key: controller.globalKey,
                    child: Column(
                      children: [
                        CustomFiled(
                            controller: controller.username,
                            icon: Icons.person,
                            label: 'Name'),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomFiled(
                            controller: controller.email,
                            icon: Icons.email,
                            label: 'Email'),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomPassword(
                          obscureText: controller.show_pass,
                          controller: controller.password,
                          function: () {
                            controller.showPassword();
                          },
                          label: 'Password',
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomPassword(
                          obscureText: controller.show_confirm_pass,
                          controller: controller.confirmPassword,
                          function: () {
                            controller.showConfirmPassword();
                          },
                          label: 'Confirm Password',
                        ),
                        SizedBox(
                          height: 90.h,
                        ),
                        CustomButton(
                            name: "Sign Up",
                            function: () {
                              controller.goToHome();
                            }),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have account? ",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 16.sp),
                            ),
                            InkWell(
                              onTap: () {
                                controller.goToSignIn();
                              },
                              child: Text(
                                "Sign in. ",
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
