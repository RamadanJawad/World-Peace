import 'package:get/get.dart';
import 'package:world_peace/core/api/api_follow.dart';
import 'package:world_peace/core/api/api_profile.dart';

class ProfileController extends GetxController {
  refreshData(int userId) async {
    await ApiProfileController().profilePage(idUser: userId);
    update();
  }

  Future sendFollow(String id) async {
    bool response = await ApiFollowController().follow(id);
    if (response) {
      update();
      print("Follow");
    }else{
      print("error");
    }
  }

  Future sendUnFollow(String id) async {
    bool response = await ApiFollowController().unFollow(id);
    if (response) {
      update();
      print("unFollow");
    }
  }
}
