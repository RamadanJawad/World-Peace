import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/comment_controller.dart';
import 'package:world_peace/core/api/api_comment.dart';
import 'package:world_peace/view/widget/home/add_commnet.dart';
import 'package:world_peace/view/widget/home/details_comment.dart';

class BodyComment extends StatelessWidget {
  final int postId;
  const BodyComment({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(
      builder: (controller) {
        return SizedBox(
          child: FutureBuilder(
            future: ApiCommentController().readComments(postId: postId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(
                  child: Text("No Internet Connection !"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (snapshot.hasData &&
                  snapshot.data!.data!.data!.isNotEmpty) {
                return Column(
                  children: [
                    DetailsComment(snapshot: snapshot, postId: postId),
                    AddComment(postId: postId),
                  ],
                );
              }
              return Center(
                  child: Column(
                children: [
                  const Spacer(),
                  Text(
                    "no comments",
                    style: GoogleFonts.cairo(fontSize: 20.sp),
                  ),
                  const Spacer(),
                  AddComment(postId: postId),
                ],
              ));
            },
          ),
        );
      },
    );
  }
}
