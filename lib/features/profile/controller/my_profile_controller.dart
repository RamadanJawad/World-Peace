import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/api/api_follow.dart';
import 'package:world_peace/core/api/api_post.dart';
import 'package:world_peace/core/api/api_profile.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/core/widget/custom_snack_bar.dart';
import 'package:world_peace/features/faqs/view/screen/faqs_screen.dart';
import 'package:world_peace/features/profile/model/follower.dart';
import 'package:world_peace/features/profile/model/profile.dart';
import 'package:world_peace/features/home/controller/home_controller.dart';
import '../model/following.dart';

class MyProfileController extends GetxController {
  Profile profile = Profile();
  List<Posts> posts = [];
  CacheData cacheData = CacheData();
  bool response = false;
  bool isLoading = false;
  HomeController homeController = Get.find();
  List<Follower> allFollower = [];
  List<Following> allFollowing = [];

  void onSelected1(select, id) {
    switch (select) {
      case 0:
        Get.defaultDialog(
          title: "Delete Post!",
          middleText: "Are You Sure Delete This Post ?",
          cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, foregroundColor: Colors.white),
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Cancel",
              style: GoogleFonts.cairo(),
            ),
          ),
          confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () async {
              await deletePost(postId: id);
            },
            child: Text(
              "Yes,Turn",
              style: GoogleFonts.cairo(),
            ),
          ),
        );
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }

  Future deletePost({required int postId}) async {
    var response = await ApiPostController().deletePost(postId: postId);
    if (response) {
      Get.back();
      await refreshData();
      await homeController.refreshData();
      showCustomSnackBar(
          context: Get.context!,
          contentType: ContentType.success,
          title: "Success",
          message: "The post has been successfully deleted");
      update();
    } else {
      showCustomSnackBar(
          context: Get.context!,
          contentType: ContentType.failure,
          title: "Failure",
          message: "Failed delete post, try again");
      Get.snackbar("Error", "Failed delete post, try again",
          backgroundColor: Colors.red, margin: const EdgeInsets.all(10));
    }
    update();
  }

  void onSelected(select) {
    switch (select) {
      case 0:
        Get.to(() => FAQScreen(), transition: Transition.fade);
        break;
      case 1:
        Get.defaultDialog(
          title: "Logout!",
          middleText: "Are you sure you want to logout?",
          cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, foregroundColor: Colors.white),
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Cancel",
              style: GoogleFonts.cairo(),
            ),
          ),
          confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                foregroundColor: Colors.white),
            onPressed: () async {
              await ApiProfileController().logout();
            },
            child: Text(
              "Yes,Logout",
              style: GoogleFonts.cairo(),
            ),
          ),
        );
        break;
    }
    update();
  }

  refreshData() async {
    posts.clear();
    profile = await ApiProfileController()
        .profilePage(idUser: AppPreferences().userId!);
    posts = profile.posts!;
    isLoading = true;
    allFollowing.clear();
    allFollowing = await ApiFollowController().allFollowing();
    allFollower.clear();
    allFollower = await ApiFollowController().allFollower();

    update();
  }

  getAllFollower() async {
    allFollower = await ApiFollowController().allFollower();

    update();
  }

  getAllFollowing() async {
    allFollowing = await ApiFollowController().allFollowing();
    update();
  }

  Future unFollow(String id) async {
    bool response = await ApiFollowController().unFollow(id);
    if (response) {
      refreshData();
      update();
    }
  }

  Future readData() async {
    profile = await ApiProfileController()
        .profilePage(idUser: AppPreferences().userId!);
    posts = profile.posts!;
    isLoading = true;
    update();
  }

  void addLike(String postId) async {
    response = await ApiPostController().sendLike(postId: postId);
    await readData();
    homeController.refreshData();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    readData();
    getAllFollower();
    getAllFollowing();
  }
}
