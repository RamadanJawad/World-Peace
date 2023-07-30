import 'package:get/get.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/api/api_follow.dart';
import 'package:world_peace/core/api/api_post.dart';
import 'package:world_peace/core/api/api_profile.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/model/profile.dart';

class ProfileController extends GetxController {
  Profile profile = Profile();
  List<Posts> posts = [];
  CacheData cacheData = CacheData();
  bool response = false;
  bool isLoading = false;
  HomeController homeController = Get.find();

  refreshData(int userId) async {
    posts.clear();
    profile = await ApiProfileController().profilePage(idUser: userId);
    posts = profile.posts!;
    isLoading = true;
    update();
  }

  Future readData() async {
    profile =
        await ApiProfileController().profilePage(idUser: cacheData.getUserId());
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

  Future sendFollow(String id) async {
    bool response = await ApiFollowController().follow(id);
    if (response) {
      readData();
      update();
    }
  }

  Future removeFollow(String id) async {
    bool response = await ApiFollowController().removeFollow(id);
    if (response) {
      readData();
      update();
    }
  }

  Future unFollow(String id) async {
    bool response = await ApiFollowController().unFollow(id);
    if (response) {
      readData();
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    readData();
  }
}
