import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/features/edit_profile/model/edit_profile.dart';
import 'package:world_peace/features/edit_profile/view/screen/edit_profile_screen.dart';
import 'package:world_peace/features/profile/controller/my_profile_controller.dart';
import 'package:world_peace/features/profile/view/widget/show_follow.dart';

class ShowUserData extends StatelessWidget {
  const ShowUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfileController>(builder: (controller) {
      return Container(
        width: double.infinity,
        height: 150.h,
        margin: const EdgeInsets.only(left: 15, top: 5, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side:
                        BorderSide(color: AppColor.primaryColor, width: 0.5.w),
                    backgroundColor: Colors.white,
                    foregroundColor: AppColor.primaryColor),
                onPressed: () {
                  CacheData cacheData = CacheData();
                  cacheData.setEditProfileModel(EditProfileModel(
                      mobile: controller.profile.user!.mobile,
                      email: controller.profile.user!.email!,
                      name: controller.profile.user!.name!,
                      imagePath: controller.profile.user!.image!));
                  Get.to(() => const EditProfile());
                },
                child: Text(
                  "Edit Profile",
                  style: GoogleFonts.cairo(fontSize: 17.sp),
                ),
              ),
            ),
            Text(
              controller.profile.user!.name!.toString(),
              style: GoogleFonts.cairo(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              controller.profile.user!.email!.toString(),
              style: GoogleFonts.cairo(
                fontSize: 18.sp,
                color: Colors.grey,
              ),
            ),
            const ShowFollow(),
          ],
        ),
      );
    });
  }
}
