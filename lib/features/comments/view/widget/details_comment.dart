import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/features/comments/controller/comment_controller.dart';
import 'package:world_peace/core/function/delete_dialog.dart';
import 'package:world_peace/core/function/update_dialog.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/features/comments/model/commentes.dart';

import '../../../../core/cache/cache.dart';
import '../../../profile/view/screen/profile_screen.dart';

class DetailsComment extends StatelessWidget {
  final AsyncSnapshot<Comments> snapshot;
  final int postId;

  const DetailsComment({
    super.key,
    required this.postId,
    required this.snapshot,
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
                    borderRadius: BorderRadius.circular(10).r,
                    border:
                        Border.all(color: const Color(0xffe9e9e9), width: 1.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data!.data!.data![index].user!.image!),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              CacheData cacheData = CacheData();
                              cacheData.setUserId(
                                  snapshot.data!.data!.data![index].user!.id!);
                              Get.to(
                                () => const ProfilePage(),
                                transition: Transition.fade,
                              );
                            },
                            child: Text(
                              snapshot.data!.data!.data![index].user!.name
                                  .toString(),
                              style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold),
                            ),
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
                                                  commentId: snapshot.data!
                                                      .data!.data![index].id!);
                                              Navigator.pop(context);
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            controller.updateComments.text =
                                                snapshot.data!.data!
                                                    .data![index].description!;
                                            showUpdateDialog(
                                              controller:
                                                  controller.updateComments,
                                              onConfirm: () {
                                                controller.updateComment(
                                                    commentId: snapshot.data!
                                                        .data!.data![index].id!,
                                                    postId: snapshot.data!.data!
                                                        .data![index].postId!);
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.mode_edit,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    )
                                  : null)
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.data!.data![index].createdAtFormatted
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
