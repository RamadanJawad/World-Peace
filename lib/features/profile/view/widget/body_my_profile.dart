import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:world_peace/core/function/pop_menu.dart';
import 'package:world_peace/features/comments/view/screen/comment_screen.dart';
import 'package:world_peace/features/home/view/widget/feature_like.dart';
import 'package:world_peace/features/home/view/widget/feature_post.dart';
import 'package:world_peace/features/home/view/widget/shimmer_home.dart';
import 'package:world_peace/features/profile/controller/my_profile_controller.dart';
import 'package:world_peace/features/profile/view/widget/show_user_data.dart';

class BodyMyProfile extends StatelessWidget {
  const BodyMyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfileController>(builder: (controller) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageUrl.backgroundImage), fit: BoxFit.fill),
        ),
        child: RefreshIndicator(
            onRefresh: () async {
              controller.refreshData();
            },
            child: controller.isLoading
                ? Column(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            height: 70.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: AppColor.primaryColor,
                            ),
                          ),
                          Positioned(
                            top: 30.h,
                            left: 10.h,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40.r,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    controller.profile.user!.image!.toString()),
                                radius: 35.r,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const ShowUserData(),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: controller.posts.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 218, 217, 217),
                                      offset: Offset(1, 2),
                                      blurRadius: 3,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10).r,
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 218, 217, 217),
                                      width: 1.w),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FeaturePost(
                                      images: controller.posts[index].images!,
                                      category: controller
                                          .posts[index].category!.name!,
                                      index: index,
                                      userId: controller.profile.user!.id!,
                                      name: controller.profile.user!.name!,
                                      createdAtFormatted: controller
                                          .posts[index].createdAtFormatted!,
                                      description:
                                          controller.posts[index].description!,
                                      title: controller.posts[index].title!,
                                      image: controller.profile.user!.image!,
                                      child: showPopMenu(
                                          onSelected: (select) =>
                                              controller.onSelected1(select,
                                                  controller.posts[index].id!)),
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        FeatureLike(
                                          postId: controller
                                              .profile.posts![index].id!,
                                          likeCount: controller
                                              .posts[index].likesCount!,
                                          likePost: controller
                                              .posts[index].likesPost!,
                                          index: controller.posts[index].id!,
                                          onTap: () {
                                            controller.addLike(controller
                                                .posts[index].id
                                                .toString());
                                          },
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.to(
                                                    () => CommentsScreen(
                                                          postId: controller
                                                              .posts[index].id!,
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
                                                  .posts[index].commentsCount!
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
                            },
                          ),
                        ),
                      )
                    ],
                  )
                : getShimmerLoading()),
      );
    });
  }
}
