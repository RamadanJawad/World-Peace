import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/profile_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/view/screen/utils/comment_screen.dart';
import 'package:world_peace/view/widget/bottom/shimmer_home.dart';
import '../../widget/home/feature_like.dart';
import '../../widget/home/feature_post.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            elevation: 0,
            centerTitle: true,
          ),
          body: RefreshIndicator(
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
                          Container(
                            width: double.infinity,
                            height: 220.h,
                            color: AppColor.primaryColor,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(controller
                                      .profile.user!.image!
                                      .toString()),
                                  radius: 35.r,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  controller.profile.user!.name!.toString(),
                                  style: GoogleFonts.cairo(
                                      fontSize: 18.sp, color: Colors.white),
                                ),
                                Text(
                                  controller.profile.user!.email!.toString(),
                                  style: GoogleFonts.cairo(
                                      fontSize: 17.sp, color: Colors.white),
                                ),
                                Visibility(
                                  visible: controller.profile.user!.id ==
                                          AppPreferences().userId
                                      ? false
                                      : true,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
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
                                          color: Color.fromARGB(
                                              255, 218, 217, 217),
                                          offset: Offset(1, 2),
                                          blurRadius: 3,
// Shadow position
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FeaturePost(
                                          images:
                                              controller.posts[index].images!,
                                          index: index,
                                          userId: controller.profile.user!.id!,
                                          name: controller.profile.user!.name!,
                                          category: controller
                                              .posts[index].category!.name!,
                                          createdAtFormatted: controller
                                              .posts[index].createdAtFormatted!,
                                          postId: controller.posts[index].id!,
                                          description: controller
                                              .posts[index].description!,
                                          title: controller.posts[index].title!,
                                          image:
                                              controller.profile.user!.image!,
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
                                              index:
                                                  controller.posts[index].id!,
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
                                                                  .posts[index]
                                                                  .id!,
                                                              index: index,
                                                            ),
                                                        transition:
                                                            Transition.fade);
                                                  },
                                                  child: const ImageIcon(
                                                    AssetImage(
                                                        ImageUrl.comment),
                                                    color: Color(0xffb5b5c4),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text(
                                                  controller.posts[index]
                                                      .commentsCount!
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
                  : getShimmerLoading()),
        );
      },
    );
  }
}
