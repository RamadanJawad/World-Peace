import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/validator/validator.dart';
import 'package:world_peace/view/widget/auth/custom_filed.dart';
import '../../../controller/auth/register_controller.dart';
import 'custom_button.dart';
import 'custom_password.dart';

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
                            validator: (value) =>
                                FieldValidator().validateUserName(value!),
                            label: 'Name'),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomFiled(
                            controller: controller.email,
                            icon: Icons.email,
                            validator: (value) =>
                                FieldValidator().validateEmail(value!),
                            label: 'Email'),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomFiled(
                            controller: controller.mobile,
                            icon: Icons.phone_android_rounded,
                            validator: (value) =>
                                FieldValidator().validatePhoneNumber(value!),
                            label: 'Phone'),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomPassword(
                          obscureText: controller.show_pass,
                          controller: controller.password,
                          validator: (value) =>
                              FieldValidator().validatePassword(value!),
                          function: () {
                            controller.showPassword();
                          },
                          label: 'Password',
                        ),
                        SizedBox(
                          height: 90.h,
                        ),
                        CustomButton(
                            name: "Sign Up",
                            function: () {
                              if (controller.globalKey.currentState!
                                  .validate()) {
                                controller.register();
                              }
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
