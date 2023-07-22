import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/my_profile_controller.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/model/edit_profile.dart';
import 'package:world_peace/view/screen/auth/edit_profile_screen.dart';
import 'package:world_peace/view/widget/bottom/shimmer_home.dart';
import '../../../core/api/api_profile.dart';
import '../../widget/home/feature_comment.dart';
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
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  child: const Icon(Icons.logout),
                  onTap: () {
                    ApiProfileController().logout();
                  },
                ),
              )
            ],
          ),
          body: RefreshIndicator(
              onRefresh: () async {
                controller.refreshData();
              },
              child: controller.isLoading
                  ? Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 220.h,
                          color: AppColor.primaryColor,
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    controller.profile.user!.image!.toString()),
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
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    foregroundColor: AppColor.primaryColor),
                                onPressed: () {
                                  CacheData cacheData = CacheData();
                                  cacheData.setEditProfileModel(
                                      EditProfileModel(
                                          mobile:
                                              controller.profile.user!.mobile,
                                          email:
                                              controller.profile.user!.email!,
                                          name: controller.profile.user!.name!,
                                          imagePath:
                                              controller.profile.user!.image!));
                                  Get.to(() => const EditProfile());
                                },
                                child: Text(
                                  "Edit Profile",
                                  style: GoogleFonts.cairo(fontSize: 17.sp),
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
                                        color: const Color(0xffe9e9e9),
                                        width: 1.w),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FeaturePost(
                                        index: index,
                                        userId: controller.profile.user!.id!,
                                        name: controller.profile.user!.name!,
                                        createdAtFormatted: controller
                                            .posts[index].createdAtFormatted!,
                                        postId: controller.posts[index].id!,
                                        description: controller
                                            .posts[index].description!,
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
                                                .posts[index].likesPost!,
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
                                          FeatureComment(
                                              index: index,
                                              postId: controller
                                                  .posts[index].id!
                                                  .toInt()),
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
      },
    );
  }
}
