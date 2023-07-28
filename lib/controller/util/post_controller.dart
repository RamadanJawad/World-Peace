import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/controller/util/main_controller.dart';
import 'package:world_peace/core/api/api_post.dart';
import 'package:world_peace/model/category.dart';

class PostController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  XFile? file;
  String selectedItem = '';
  List<String> categories = ["All"];
  List<Categories> category = [];
  final ImagePicker imagePicker = ImagePicker();
  final jobRoleDropdownCtrl = TextEditingController();
  HomeController homeController = Get.find();
  MainController mainController = Get.find();
  getImage() async {
    file = await imagePicker.pickImage(source: ImageSource.gallery);
    update();
  }

  getCategory() async {
    category = await ApiPostController().readCategories();
    for (int i = 0; i < category.length; i++) {
      categories.add(category[i].name!.toString());
    }
    print(categories);
    update();
  }

  onChange(select) {
    selectedItem = select;
    update();
  }

  createPost() async {
    bool response;
    Get.dialog(const Center(
      child: CupertinoActivityIndicator(
        radius: 20,
        color: Colors.white,
      ),
    ));
    if (file != null) {
      response = await ApiPostController().createPost(
          title: titleController.text,
          description: descriptionController.text,
          category: "1",
          imageFile: file!.path.toString());
      update();
    } else {
      response = await ApiPostController().createPost(
        title: titleController.text,
        description: descriptionController.text,
        category: "1",
        imageFile: "",
      );
    }
    if (response) {
      homeController.refreshData();
      Get.back(closeOverlays: true);
      mainController.persistentTabController.jumpToTab(0);
      update();
      Get.snackbar("Success", "Create Post Success",
          backgroundColor: Colors.green, margin: const EdgeInsets.all(10));
    } else {
      Get.back(closeOverlays: true);
      Get.snackbar("Error", "Failed to create post, try again",
          backgroundColor: Colors.red, margin: const EdgeInsets.all(10));
    }
    descriptionController.text = "";
    titleController.text = "";
    file = null;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
    titleController.dispose();
  }

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }
}
