import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/controller/util/my_profile_controller.dart';
import 'package:world_peace/core/api/api_profile.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/model/edit_profile.dart';
import '../../view/screen/bottom/home_screen.dart';

class EditProfileController extends GetxController {
  late TextEditingController email;
  late TextEditingController name;
  late TextEditingController mobile;
  String imagePath = "";
  XFile? file;
  final ImagePicker imagePicker = ImagePicker();
  EditProfileModel editProfileModel = CacheData().getData();
  GlobalKey<FormState> globalKey = GlobalKey();
  EditProfileResponse profileResponse = EditProfileResponse();
  MyProfileController profileController = Get.find();
  HomeController homeController = Get.find();
  bool isTabbed = false;

  getImage() async {
    file = await imagePicker.pickImage(source: ImageSource.gallery);
    imagePath = file!.path.toString();
    update();
  }

  editProfiles() async {
    Get.dialog(const Center(
      child: CupertinoActivityIndicator(
        radius: 20,
        color: Colors.white,
      ),
    ));
    bool profileResponse;
    if (file != null) {
      profileResponse = await ApiProfileController().editProfile(
          name: name.text.toString(),
          email: email.text.toString(),
          mobile: mobile.text.toString(),
          image: file!.path.toString());
      update();
    } else {
      profileResponse = await ApiProfileController().editProfile(
          name: name.text.toString(),
          email: email.text.toString(),
          mobile: mobile.text.toString(),
          image: "");
      update();
    }
    if (profileResponse) {
      Get.snackbar("Success", "The data has been modified successfully",
          backgroundColor: Colors.green, margin: const EdgeInsets.all(10));
    } else {
      Get.snackbar("faild", "The data has not been modified ",
          backgroundColor: Colors.red, margin: const EdgeInsets.all(10));
    }
    profileController.readData();
    homeController.refreshData();
    update();
  }

  showData() {
    name.text = editProfileModel.name.toString();
    email.text = editProfileModel.email.toString();
    mobile.text = editProfileModel.mobile.toString();
    imagePath = editProfileModel.imagePath!;
  }

  void goToHome() {
    Get.to(() => const HomeScreen(), transition: Transition.fade);
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    name = TextEditingController();
    mobile = TextEditingController();

    showData();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    name.dispose();
    mobile.dispose();
  }
}
