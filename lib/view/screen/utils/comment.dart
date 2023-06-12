import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/comment_controller.dart';
import '../../../core/constant/color.dart';
import '../../../model/commentes.dart';
import '../../widget/home/add_commnet.dart';
import '../../widget/home/details_comment.dart';

class CommentsScreen extends StatelessWidget {
  final AsyncSnapshot<Comments> snapshot2;
  final int postId;
  final int index;

  const CommentsScreen(
      {super.key,
      required this.snapshot2,
      required this.postId,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommentController());
    return RefreshIndicator(
      onRefresh: () async {
        controller.refreshData(postId);
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
        body: Column(children: [
          DetailsComment(
            index: index,
            snapshot: snapshot2,
            postId: postId,
          ),
          AddComment(postId: postId),
        ]),
      ),
    );
  }
}
