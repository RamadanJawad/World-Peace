import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor),
                child: Text(
                  "Post",
                  style: GoogleFonts.cairo(fontSize: 20.sp),
                )),
          ),
        ],
        title: Text(
          "New Post",
          style: GoogleFonts.cairo(color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                  "Heather Clark",
                  style: GoogleFonts.cairo(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            TextFormField(
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
          ],
        ),
      ),
    );
  }
}
