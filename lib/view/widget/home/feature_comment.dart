import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/controller/util/comment_controller.dart';
import 'package:world_peace/core/api/api_comment.dart';
import 'package:world_peace/core/constant/image.dart';
import '../../screen/utils/comment_screen.dart';

class FeatureComment extends StatelessWidget {
  final int index;
  final int postId;

  const FeatureComment({super.key, required this.index, required this.postId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(
      init: CommentController(),
      builder: (controller) {
        return FutureBuilder(
          future: ApiCommentController().readComments(postId: postId),
          builder: (context, snapshot2) {
            return RefreshIndicator(
              onRefresh: () async {
                await controller.refreshData(postId);
              },
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const CommentsScreen(),
                          transition: Transition.fade);
                    },
                    child: const ImageIcon(
                      AssetImage(ImageUrl.comment),
                      color: Color(0xffb5b5c4),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    child: snapshot2.hasData &&
                            snapshot2.data!.data!.data!.isNotEmpty
                        ? Text(
                            snapshot2.data!.data!.data!.length.toString(),
                            style: const TextStyle(
                              color: Color(0xffb5b5c4),
                            ),
                          )
                        : const Text(
                            "0",
                            style: TextStyle(
                              color: Color(0xffb5b5c4),
                            ),
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
