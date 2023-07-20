import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/api/api_post.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:world_peace/view/screen/utils/comment_screen.dart';
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
          child: FutureBuilder(
            future: ApiPostController().readPost(pageNumber: controller.page),
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
              } else if (snapshot.hasData && snapshot.data!.posts!.isNotEmpty) {
                return RefreshIndicator(
                  onRefresh: () async {
                    controller.refreshData();
                  },
                  child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: snapshot.data!.posts!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10).r,
                            border: Border.all(
                                color: const Color(0xffe9e9e9), width: 1.w),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FeaturePost(
                                index: index,
                                userId: snapshot.data!.posts![index].user!.id!,
                                name: snapshot.data!.posts![index].user!.name!,
                                createdAtFormatted: snapshot
                                    .data!.posts![index].createdAtFormatted!,
                                postId: snapshot.data!.posts![index].id!,
                                description:
                                    snapshot.data!.posts![index].description!,
                                title: snapshot.data!.posts![index].title!,
                                image:
                                    snapshot.data!.posts![index].user!.image!,
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  FeatureLike(
                                      postId: snapshot.data!.posts![index].id!,
                                      likeCount: snapshot
                                          .data!.posts![index].likesPost!,
                                      likePost: snapshot
                                          .data!.posts![index].likesPost!,
                                      index: snapshot
                                          .data!.posts![index].id!),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(
                                              () => CommentsScreen(
                                                    postId: snapshot.data!
                                                        .posts![index].id!,
                                                    index: index,
                                                  ),
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
                                      Text(
                                        snapshot
                                            .data!.posts![index].commentsCount!
                                            .toString(),
                                        style: const TextStyle(
                                          color: Color(0xffb5b5c4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                );
              } else {
                return const Center(child: Text("no data"));
              }
            },
          ),
        );
      },
    );
  }
}
