import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/comment_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/shared/save_data.dart';

class AddComment extends StatelessWidget {
  final int postId;
  const AddComment({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(builder: (controller) {
      return Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(AppPreferences().userImage),
                  maxRadius: 25,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: controller.comment,
                    maxLines: 2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: " write...",
                      floatingLabelStyle:
                          GoogleFonts.ubuntu(color: AppColor.primaryColor),
                      labelStyle: GoogleFonts.cairo(),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10).r,
                        borderSide: const BorderSide(
                          color: Color(0xffD8D8D8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10).r,
                        borderSide: const BorderSide(
                          color: Color(0xffD8D8D8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10).r,
                        borderSide: const BorderSide(
                          color: Color(0xffD8D8D8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.comment.text.isNotEmpty) {
                      controller.addComment(postId);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30).r),
                      padding: const EdgeInsets.all(13)),
                  child: Text(
                    "Post",
                    style: GoogleFonts.ubuntu(
                        fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
