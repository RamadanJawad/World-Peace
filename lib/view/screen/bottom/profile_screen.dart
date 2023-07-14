import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/profile_controller.dart';
import 'package:world_peace/core/api/api_profile.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/shared/save_data.dart';
import '../../widget/home/feature_comment.dart';
import '../../widget/home/feature_like.dart';
import '../../widget/home/feature_post.dart';

class ProfilePage extends StatelessWidget {
  final int idUser;

  const ProfilePage({
    super.key,
    required this.idUser,
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
          body: FutureBuilder(
            future: ApiProfileController().profilePage(idUser: idUser),
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
              } else if (snapshot.hasData) {
                return RefreshIndicator(
                  onRefresh: () async {
                    controller.refreshData(idUser);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 220.h,
                        color: AppColor.primaryColor,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data!.user!.image!.toString()),
                              radius: 35.r,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              snapshot.data!.user!.name!.toString(),
                              style: GoogleFonts.cairo(
                                  fontSize: 18.sp, color: Colors.white),
                            ),
                            Text(
                              snapshot.data!.user!.email!.toString(),
                              style: GoogleFonts.cairo(
                                  fontSize: 17.sp, color: Colors.white),
                            ),
                            Visibility(
                              visible: snapshot.data!.user!.id ==
                                      AppPreferences().userId
                                  ? false
                                  : true,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    foregroundColor: AppColor.primaryColor),
                                onPressed: snapshot.data!.friend == 2
                                    ? () async {
                                        await controller
                                            .removeFollow(idUser.toString());
                                      }
                                    : () async {
                                        await controller
                                            .sendFollow(idUser.toString());
                                      },
                                child: Text(
                                  snapshot.data!.friend == 2
                                      ? "unFollow"
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
                            itemCount: snapshot.data!.posts!.data!.length,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FeaturePost(
                                      index: index,
                                      userId: snapshot.data!.user!.id!,
                                      name: snapshot.data!.user!.name!,
                                      createdAtFormatted: snapshot.data!.posts!
                                          .data![index].createdAtFormatted!,
                                      postId: snapshot
                                          .data!.posts!.data![index].id!,
                                      description: snapshot.data!.posts!
                                          .data![index].description!,
                                      title: snapshot
                                          .data!.posts!.data![index].title!,
                                      image: snapshot.data!.user!.image!,
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        FeatureLike(
                                            postId: snapshot
                                                .data!.posts!.data![index].id!,
                                            likeCount: snapshot.data!.posts!
                                                .data![index].likesCount!,
                                            index: index),
                                        const Spacer(),
                                        FeatureComment(
                                            index: index,
                                            postId: snapshot
                                                .data!.posts!.data![index].id!
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
                  ),
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
