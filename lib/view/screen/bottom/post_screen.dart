import 'dart:io';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/controller/util/post_controller.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/shared/save_data.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());
    return Scaffold(
      backgroundColor: AppColor.primaryColor.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (controller.titleController.text.isNotEmpty &&
                    controller.descriptionController.text.isNotEmpty) {
                  controller.createPost();
                } else {
                  Get.snackbar("Error", "Please enter the data",
                      backgroundColor: Colors.red,
                      margin: const EdgeInsets.all(10));
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor),
              child: Text(
                "Post",
                style: GoogleFonts.cairo(fontSize: 20.sp),
              ),
            ),
          ),
        ],
        title: Text(
          "New Post",
          style: GoogleFonts.cairo(color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(ImageUrl.person1),
                    radius: 25,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    AppPreferences().name,
                    style: GoogleFonts.cairo(
                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 150.w,
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
                cursorColor: AppColor.primaryColor,
                decoration: InputDecoration.collapsed(
                    hintText: "What's on your mind?",
                    hintStyle: GoogleFonts.cairo(fontSize: 18.sp)),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  InkWell(
                    child: Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 1, color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
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
  }
}
