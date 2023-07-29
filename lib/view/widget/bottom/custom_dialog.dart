import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/view/screen/bottom/profile_screen.dart';

void showCustomDialog(String title, List data) {
  Get.defaultDialog(
    title: title,
    contentPadding: const EdgeInsets.all(0),
    content: SizedBox(
      width: 250.w,
      height: 200.h,
      child: data.isNotEmpty
          ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(data[index].data!.image.toString()),
                          radius: 27.r,
                        ),
                        SizedBox(
                          width: 10.w,
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
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10.h,
                      thickness: 0.7,
                    )
                  ],
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
