import 'package:world_peace/model/edit_profile.dart';

class CacheData {
  static int userId = 0;
  static String username = "";
  static EditProfileModel editProfileModel = EditProfileModel();

  void setUserId(int id) {
    userId = id;
  }

  int getUserId() {
    return userId;
  }

  void setUserName(String name) {
    username = name;
  }

  String getUserName() {
    return username;
  }

  void setEditProfileModel(EditProfileModel data) {
    editProfileModel = data;
  }

  EditProfileModel getData() {
    return editProfileModel;
  }
}
