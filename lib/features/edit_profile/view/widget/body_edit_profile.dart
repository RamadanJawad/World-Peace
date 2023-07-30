import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/features/edit_profile/controller/edit_profile_controller.dart';
import 'package:world_peace/features/auth/view/widget/custom_button.dart';
import 'package:world_peace/features/auth/view/widget/custom_filed.dart';

class BodyEditProfile extends StatelessWidget {
  const BodyEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
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
                    child: InkWell(
                      onTap: () {
                        controller.getImage();
                        controller.isTabbed = true;
                      },
                      child: controller.isTabbed && controller.file != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                File(controller.file!.path),
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: NetworkImage(
                                controller.imagePath,
                              ),
                              maxRadius: 70.r,
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                    key: controller.globalKey,
                    child: Column(children: [
                      CustomFiled(
                          controller: controller.name,
                          icon: Icons.person,
                          label: 'Name'),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomFiled(
                          controller: controller.email,
                          icon: Icons.email,
                          label: 'Email'),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomFiled(
                          controller: controller.mobile,
                          icon: Icons.phone_android,
                          label: 'Phone number'),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomButton(
                          name: "Save",
                          function: () {
                            controller.editProfiles();
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
