import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world_peace/features/home/controller/home_controller.dart';
import 'package:world_peace/features/main/controller/main_controller.dart';
import 'package:world_peace/core/api/api_post.dart';
import 'package:world_peace/features/post/model/category.dart';

class PostController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  XFile? file;
  String categoryId = "";
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
    update();
  }

  onChange(select) {
    selectedItem = select;
    for (int i = 0; i < category.length; i++) {
      if (category[i].name.toString() == selectedItem.toString()) {
        categoryId = category[i].id!.toString();
      }
    }
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
          category: categoryId,
          imageFile: file!.path.toString());
      update();
    } else {
      response = await ApiPostController().createPost(
        title: titleController.text,
        description: descriptionController.text,
        category: categoryId,
        imageFile: "",
      );
    }
    if (response) {
      homeController.refreshData();
      update();
      mainController.persistentTabController.jumpToTab(0);
      Get.back();
      update();
      Get.snackbar("Success", "Create Post Success",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.thumb_up_off_alt_rounded,
            color: Colors.white,
          ));
    } else {
      Get.back();
      update();
      Get.snackbar("Error", "Failed to create post, try again",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ));
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
