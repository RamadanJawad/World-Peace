import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/controller/auth/changePasswordController.dart';
import 'package:world_peace/view/widget/auth/CustomButton.dart';
import 'package:world_peace/view/widget/auth/CustomFiled%20.dart';

class BodyChangePassword extends StatelessWidget {
  const BodyChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(builder: (controller) {
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
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                    key: controller.globalKey,
                    child: Column(children: [
                      CustomFiled(
                          controller: controller.currentPassword,
                          icon: Icons.lock,
                          label: 'Current password'),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomFiled(
                          controller: controller.newPassword,
                          icon: Icons.lock,
                          label: 'New password'),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomFiled(
                          controller: controller.repeaPassword,
                          icon: Icons.lock,
                          label: 'Repeat password'),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomButton(
                          name: "Save",
                          function: () {
                            controller.goToHome();
                          }),
                    ]),
                  )
                ],
              )),
        )),
      );
    });
  }
}
