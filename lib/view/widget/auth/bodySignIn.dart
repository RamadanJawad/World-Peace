import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';

import '../../../controller/auth/signIn_controller.dart';
import 'CustomButton.dart';
import 'CustomFiled .dart';
import 'CustomPassword.dart';

class BodySignIn extends StatelessWidget {
  const BodySignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (controller) {
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
                    "Let’s sign you in.",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold, fontSize: 25.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "welcome back.\nyou've been missed!",
                    style: GoogleFonts.cairo(fontSize: 23.sp, height: 1.h),
                  ),
                  Form(
                    key: controller.globalKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
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
                        Center(
                            child: TextButton(
                                onPressed: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text("Forget Password ?",
                                    style: GoogleFonts.cairo(
                                        color: Colors.grey,
                                        fontSize: 15.sp,
                                        decoration:
                                            TextDecoration.underline)))),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomButton(
                            name: "Sign In",
                            function: () {
                              controller.goToHome();
                            }),
                        SizedBox(
                          height: 120.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 52.w,
                              height: 52.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5))),
                              child: Image(
                                image: AssetImage(ImageUrl.face),
                                width: 10.w,
                                height: 20.h,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              width: 52.w,
                              height: 52.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5))),
                              child: Image(
                                image: AssetImage(ImageUrl.ios),
                                width: 10.w,
                                height: 20.h,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account ? ",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 16.sp),
                            ),
                            InkWell(
                              onTap: () {
                                controller.goToSignUp();
                              },
                              child: Text(
                                "Sign Up ",
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
