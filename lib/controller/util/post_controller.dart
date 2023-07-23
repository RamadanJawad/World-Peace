import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/api/api_post.dart';

class PostController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  XFile? file;
  String selectedItem = '';
  List<String> categories = ["Mokawel"];
  final ImagePicker imagePicker = ImagePicker();
  final jobRoleDropdownCtrl = TextEditingController();
  HomeController homeController = Get.find();

  getImage() async {
    file = await imagePicker.pickImage(source: ImageSource.gallery);
    update();
  }

  onChange(select) {
    selectedItem = select;
    update();
  }

  createPost() async {
    var response;
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
      Get.snackbar("Success", "Create Post Success",
          backgroundColor: Colors.green, margin: const EdgeInsets.all(10));
      
    } else {
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
    super.onInit();
  }
}
