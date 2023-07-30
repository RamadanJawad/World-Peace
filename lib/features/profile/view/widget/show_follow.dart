import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/features/profile/controller/my_profile_controller.dart';
import 'package:world_peace/features/profile/view/widget/custom_dialog.dart';

class ShowFollow extends StatelessWidget {
  const ShowFollow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfileController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showCustomDialog("Following", controller.allFollowing);
            },
            child: Row(
              children: [
                Text(
                  controller.profile.followingCount.toString(),
                  style: GoogleFonts.cairo(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  " Following",
                  style:
                      GoogleFonts.cairo(fontSize: 17.sp, color: Colors.black),
                )
              ],
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          InkWell(
            onTap: () {
              showCustomDialog("Follower", controller.allFollower);
            },
            child: Row(
              children: [
                Text(
                  controller.profile.followerCount.toString(),
                  style: GoogleFonts.cairo(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  " Followers",
                  style:
                      GoogleFonts.cairo(fontSize: 17.sp, color: Colors.black),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
