import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/features/comments/controller/comment_controller.dart';
import 'package:world_peace/features/comments/view/widget/body_comment.dart';
import '../../../../core/constant/color.dart';

class CommentsScreen extends StatelessWidget {
  final int? postId;
  final int? index;

  const CommentsScreen({super.key, this.postId, this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommentController());
    return RefreshIndicator(
      onRefresh: () async {
        controller.refreshData(postId!);
      },
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            "Comments",
            style: GoogleFonts.cairo(fontSize: 20.sp, color: Colors.white),
          ),
        ),
        body: BodyComment(
          postId: postId!,
        ),
      ),
    );
  }
}
