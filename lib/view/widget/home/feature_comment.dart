import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/api/api_comment.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:world_peace/view/widget/home/add_commnet.dart';
import 'package:world_peace/view/widget/home/details_comment.dart';

class FeatureComment extends StatelessWidget {
  final int index;
  final int postId;

  const FeatureComment({super.key, required this.index, required this.postId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return FutureBuilder(
          future: ApiCommentController().readComments(postId: postId),
          builder: (context, snapshot2) {
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      useSafeArea: true,
                      useRootNavigator: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            DetailsComment(snapshot2: snapshot2),
                            AddComment(postId: postId),
                          ],
                        );
                      },
                    );
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
            );
          },
        );
      },
    );
  }
}
