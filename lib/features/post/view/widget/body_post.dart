import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/features/post/controller/post_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:world_peace/core/shared/save_data.dart';

class BodyPost extends StatelessWidget {
  const BodyPost({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(builder: (controller) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageUrl.backgroundImage), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(AppPreferences().userImage),
                      radius: 25,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      AppPreferences().name,
                      style: GoogleFonts.cairo(
                          fontSize: 16.5.sp, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 140.w,
                      child: CustomDropdown(
                        hintText: 'Category Type',
                        listItemStyle:
                            GoogleFonts.cairo(color: AppColor.primaryColor),
                        selectedStyle: GoogleFonts.cairo(),
                        items: controller.categories,
                        hintStyle: GoogleFonts.cairo(),
                        controller: controller.jobRoleDropdownCtrl,
                        excludeSelected: false,
                        borderRadius: BorderRadius.circular(10).r,
                        onChanged: (select) {
                          controller.onChange(select);
                        },
                        fillColor: const Color.fromARGB(254, 241, 241, 241),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextFormField(
                  controller: controller.titleController,
                  style: GoogleFonts.cairo(fontSize: 18.sp),
                  cursorColor: AppColor.primaryColor,
                  decoration: InputDecoration.collapsed(
                      hintText: "Title of the Post ?",
                      hintStyle: GoogleFonts.cairo(fontSize: 18.sp)),
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextFormField(
                  controller: controller.descriptionController,
                  style: GoogleFonts.cairo(fontSize: 18.sp),
                  maxLines: 3,
                  cursorColor: AppColor.primaryColor,
                  decoration: InputDecoration.collapsed(
                      hintText: "What's on your mind?",
                      hintStyle: GoogleFonts.cairo(fontSize: 18.sp)),
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.getImage();
                      },
                      child: Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: Colors.grey.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          size: 30,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                GetBuilder<PostController>(builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    height: controller.file == null ? 50 : 300.h,
                    child: ClipRRect(
                      child: controller.file != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20).r,
                              child: controller.file != null
                                  ? Image.file(
                                      File(controller.file!.path),
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(Icons.no_flash_rounded))
                          : null,
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      );
    });
  }
}
