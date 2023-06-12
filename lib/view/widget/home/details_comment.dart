import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/comment_controller.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:world_peace/core/function/delete_dialog.dart';
import 'package:world_peace/core/function/update_dialog.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/model/commentes.dart';

class DetailsComment extends StatelessWidget {
  final int index;
  final AsyncSnapshot<Comments> snapshot;
  final int postId;

  const DetailsComment({
    super.key,
    required this.index,
    required this.snapshot,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(builder: (controller) {
      return Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: ListView.builder(
              itemCount: snapshot.data!.commentsCount,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10).r,
                    border: Border.all(
                        color: const Color(0xffe9e9e9), width: 1.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(ImageUrl.person1),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            snapshot.data!.data!.data![index].user!.name
                                .toString(),
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          SizedBox(
                              child: AppPreferences().userId ==
                                      snapshot.data!.data!.data![index].userId
                                  ? Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showDeleteDialog(onConfirm: () {
                                              controller.deleteComment(
                                                  postId: snapshot.data!.data!
                                                      .data![index].postId!,
                                                  commentId: snapshot
                                                      .data!
                                                      .data!
                                                      .data![index]
                                                      .id!);
                                              Get.back();
                                            });
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showUpdateDialog(
                                              controller:
                                                  controller.updateComments,
                                              onConfirm: () {
                                                controller.updateComment(
                                                    commentId: snapshot
                                                        .data!
                                                        .data!
                                                        .data![index]
                                                        .id!,
                                                    postId: snapshot
                                                        .data!
                                                        .data!
                                                        .data![index]
                                                        .postId!);
                                                Get.back();
                                              },
                                            );
                                          },
                                          icon: const Icon(Icons.mode_edit),
                                        ),
                                      ],
                                    )
                                  : null)
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot
                                .data!.data!.data![index].createdAtFormatted
                                .toString(),
                            style: GoogleFonts.montserrat(color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        snapshot.data!.data!.data![index].description!,
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w400, fontSize: 17.sp),
                      ),
                    ],
                  ),
                );
              }),
        ),
      );
    });
  }
}
