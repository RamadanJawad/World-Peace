import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void showCustomDialog(String title, List data) {
  Get.defaultDialog(
    title: title,
    contentPadding: const EdgeInsets.all(0),
    content: SizedBox(
      width: 200.w,
      height: 200.h,
      child: data.isNotEmpty
          ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(data[index].data!.image.toString()),
                      radius: 25.r,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      data[index].data!.name!,
                      style: GoogleFonts.cairo(
                          fontSize: 17.sp, color: Colors.black),
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
