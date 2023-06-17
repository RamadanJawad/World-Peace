import 'package:get/get.dart';
import 'package:world_peace/core/api/api_profile.dart';

class ProfileController extends GetxController {
  refreshData(int userId) async {
    await ApiProfileController().profilePage(idUser: userId);
    update();
  }
}
