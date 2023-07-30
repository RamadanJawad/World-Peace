import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/my_profile_controller.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/view/screen/bottom/profile_screen.dart';

import '../../../core/constant/color.dart';

void showCustomDialog(String title, List data) {
  final MyProfileController controller = Get.put(MyProfileController());

  Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(fontSize: 17.sp),
    contentPadding: const EdgeInsets.all(0),
    content: SizedBox(
      width: 320.w,
      height: 200.h,
      child: data.isNotEmpty
          ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                data[index].data!.image.toString()),
                            radius: 25.r,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          InkWell(
                            onTap: () {
                              CacheData cacheData = CacheData();
                              cacheData.setUserId(data[index].data!.id!);
                              Get.to(() => const ProfilePage(),
                                  transition: Transition.fade);
                            },
                            child: Text(
                              data[index].data!.name!,
                              style: GoogleFonts.cairo(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              controller
                                  .unFollow(data[index].data!.id!.toString());

                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15).r),
                            ),
                            child: Text(
                              "UnFollow",
                              style: GoogleFonts.cairo(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 10.h,
                        thickness: 0.7,
                      )
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Text(
                "No $title yet!",
                style: GoogleFonts.cairo(fontSize: 17.sp, color: Colors.black),
              ),
            ),
    ),
  );
}
