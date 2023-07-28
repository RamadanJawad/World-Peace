import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/view/screen/utils/comment_screen.dart';
import 'package:world_peace/view/widget/bottom/shimmer_home.dart';
import 'package:world_peace/view/widget/home/feature_like.dart';
import 'package:world_peace/view/widget/home/feature_post.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
            margin: const EdgeInsets.all(5),
            child: RefreshIndicator(
                backgroundColor: Colors.white,
                color: AppColor.primaryColor,
                onRefresh: () async {
                  controller.refreshData();
                },
                child: controller.isLoading
                    ? ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.isLoadingMore
                            ? controller.post.length + 1
                            : controller.post.length,
                        itemBuilder: (context, index) {
                          if (index < controller.post.length) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10).r,
                                border: Border.all(
                                    color: const Color(0xffe9e9e9), width: 1.w),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FeaturePost(
                                    images: controller.post[index].images!,
                                    index: index,
                                    userId: controller.post[index].user!.id!,
                                    name: controller.post[index].user!.name!,
                                    createdAtFormatted: controller
                                        .post[index].createdAtFormatted!,
                                    postId: controller.post[index].id!,
                                    description:
                                        controller.post[index].description!,
                                    title: controller.post[index].title!,
                                    image: controller.post[index].user!.image!,
                                    category: controller.post[index].category!.name!,
                                  ),
                                  const Divider(),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FeatureLike(
                                          postId: controller.post[index].id!,
                                          likeCount: controller
                                              .post[index].likesCount!,
                                          likePost:
                                              controller.post[index].likesPost!,
                                          index: controller.post[index].id!,
                                          onTap: () {
                                            controller.addLike(controller
                                                .post[index].id
                                                .toString());
                                          },
                                        ),
                                        const VerticalDivider(
                                          color: Colors.grey,
                                          width: 1,
                                          thickness: 1,
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.to(
                                                    () => CommentsScreen(
                                                          postId: controller
                                                              .post[index].id!,
                                                          index: index,
                                                        ),
                                                    transition:
                                                        Transition.fade);
                                              },
                                              child: const ImageIcon(
                                                AssetImage(ImageUrl.comment),
                                                color: Color(0xffb5b5c4),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              controller
                                                  .post[index].commentsCount!
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Color(0xffb5b5c4),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          }
                        })
                    : getShimmerLoading()));
      },
    );
  }
}
