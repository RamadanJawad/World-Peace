import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/features/comments/view/screen/comment_screen.dart';
import 'package:world_peace/features/home/view/widget/feature_like.dart';
import 'package:world_peace/features/home/view/widget/feature_post.dart';
import 'package:world_peace/features/home/view/widget/shimmer_home.dart';
import 'package:world_peace/features/profile/controller/profile_controller.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return RefreshIndicator(
          onRefresh: () async {
            controller.refreshData(controller.cacheData.getUserId());
          },
          child: controller.isLoading
              ? Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageUrl.backgroundImage),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
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
                      Container(
                        width: double.infinity,
                        height: 175.h,
                        margin:
                            const EdgeInsets.only(left: 15, top: 5, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Visibility(
                                visible: controller.profile.user!.id ==
                                        AppPreferences().userId
                                    ? false
                                    : true,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: AppColor.primaryColor,
                                              width: 0.5.w),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      backgroundColor: Colors.white,
                                      foregroundColor: AppColor.primaryColor),
                                  onPressed: controller.profile.friend == 2
                                      ? () async {
                                          await controller.removeFollow(
                                              controller.cacheData
                                                  .getUserId()
                                                  .toString());
                                        }
                                      : controller.profile.friend == 1
                                          ? () async {
                                              await controller.unFollow(
                                                  controller.cacheData
                                                      .getUserId()
                                                      .toString());
                                            }
                                          : () async {
                                              await controller.sendFollow(
                                                  controller.cacheData
                                                      .getUserId()
                                                      .toString());
                                            },
                                  child: Text(
                                    controller.profile.friend == 2
                                        ? "You Send Request"
                                        : controller.profile.friend == 1
                                            ? "Unfollow"
                                            : "follow",
                                    style: GoogleFonts.cairo(fontSize: 17.sp),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              controller.profile.user!.name!.toString(),
                              style: GoogleFonts.cairo(
                                  fontSize: 20.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              controller.profile.user!.email!.toString(),
                              style: GoogleFonts.cairo(
                                fontSize: 18.sp,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      controller.profile.followingCount
                                          .toString(),
                                      style: GoogleFonts.cairo(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      " Following",
                                      style: GoogleFonts.cairo(
                                          fontSize: 17.sp, color: Colors.black),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      controller.profile.followerCount
                                          .toString(),
                                      style: GoogleFonts.cairo(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      " Followers",
                                      style: GoogleFonts.cairo(
                                          fontSize: 17.sp, color: Colors.black),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: controller.posts.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10).r,
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 218, 217, 217),
                                      width: 1.w),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 218, 217, 217),
                                      offset: Offset(1, 2),
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FeaturePost(
                                      images: controller.posts[index].images!,
                                      index: index,
                                      userId: controller.profile.user!.id!,
                                      name: controller.profile.user!.name!,
                                      category: controller
                                          .posts[index].category!.name!,
                                      createdAtFormatted: controller
                                          .posts[index].createdAtFormatted!,
                                      description:
                                          controller.posts[index].description!,
                                      title: controller.posts[index].title!,
                                      image: controller.profile.user!.image!,
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
                  ),
                )
              : getShimmerLoading());
    });
  }
}
