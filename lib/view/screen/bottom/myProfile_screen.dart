import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/my_profile_controller.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:world_peace/model/edit_profile.dart';
import 'package:world_peace/view/screen/auth/edit_profile_screen.dart';
import 'package:world_peace/view/screen/utils/comment_screen.dart';
import 'package:world_peace/view/widget/bottom/custom_dialog.dart';
import 'package:world_peace/view/widget/bottom/custom_setting.dart';
import 'package:world_peace/view/widget/bottom/shimmer_home.dart';
import '../../widget/home/feature_like.dart';
import '../../widget/home/feature_post.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfileController>(
      init: MyProfileController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            elevation: 0,
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  child: showCustomPopMenu(
                    onSelected: (select) => controller.onSelected(select),
                  ),
                ),
              )
            ],
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageUrl.backgroundImage),
                  fit: BoxFit.fill),
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
                                    backgroundImage: NetworkImage(controller
                                        .profile.user!.image!
                                        .toString()),
                                    radius: 35.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: 150.h,
                            margin: const EdgeInsets.only(
                                left: 15, top: 5, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        side: BorderSide(
                                            color: AppColor.primaryColor,
                                            width: 0.5.w),
                                        backgroundColor: Colors.white,
                                        foregroundColor: AppColor.primaryColor),
                                    onPressed: () {
                                      CacheData cacheData = CacheData();
                                      cacheData.setEditProfileModel(
                                          EditProfileModel(
                                              mobile: controller
                                                  .profile.user!.mobile,
                                              email: controller
                                                  .profile.user!.email!,
                                              name: controller
                                                  .profile.user!.name!,
                                              imagePath: controller
                                                  .profile.user!.image!));
                                      Get.to(() => const EditProfile());
                                    },
                                    child: Text(
                                      "Edit Profile",
                                      style: GoogleFonts.cairo(fontSize: 17.sp),
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
                                    InkWell(
                                      onTap: () {
                                        showCustomDialog("Following",
                                            controller.allFollowing);
                                      },
                                      child: Row(
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
                                                fontSize: 17.sp,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showCustomDialog(
                                            "Follower", controller.allFollower);
                                      },
                                      child: Row(
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
                                                fontSize: 17.sp,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                                          color: Color.fromARGB(
                                              255, 218, 217, 217),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FeaturePost(
                                          images:
                                              controller.posts[index].images!,
                                          category: controller
                                              .posts[index].category!.name!,
                                          index: index,
                                          userId: controller.profile.user!.id!,
                                          name: controller.profile.user!.name!,
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
                      )
                    : getShimmerLoading()),
          ),
        );
      },
    );
  }
}
