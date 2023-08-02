import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/features/post/controller/post_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/features/post/view/widget/body_post.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
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
                      colorText: Colors.white,
                      margin: const EdgeInsets.all(10),
                      icon: const Icon(
                        Icons.error,
                        color: Colors.white,
                      ));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: AppColor.primaryColor, width: 1.w),
                elevation: 0,
                foregroundColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8).r),
              ),
              child: Text(
                "Post",
                style: GoogleFonts.cairo(fontSize: 18.5.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
        title: Text(
          "Create Post",
          style: GoogleFonts.cairo(color: Colors.white),
        ),
      ),
      body: const BodyPost(),
    );
  }
}
