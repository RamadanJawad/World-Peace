import 'package:get/get.dart';
import 'package:world_peace/core/api/api_follow.dart';
import 'package:world_peace/core/api/api_post.dart';
import 'package:world_peace/core/api/api_profile.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/model/follower.dart';
import 'package:world_peace/model/profile.dart';
import 'package:world_peace/controller/util/home_controller.dart';

import '../../model/following.dart';

class MyProfileController extends GetxController {
  Profile profile = Profile();
  List<Posts> posts = [];
  CacheData cacheData = CacheData();
  bool response = false;
  bool isLoading = false;
  HomeController homeController = Get.find();
  List<Follower> allFollower = [];
  List<Following> allFollowing = [];

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
