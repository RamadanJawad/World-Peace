import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world_peace/core/api/api_post.dart';
import 'package:world_peace/model/category.dart';

class PostController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  XFile? file;
  String selectedItem = '';
  List<String> categories = ["Mokawel"];
  final ImagePicker imagePicker = ImagePicker();
  final jobRoleDropdownCtrl = TextEditingController();

  getImage() async {
    file = await imagePicker.pickImage(source: ImageSource.gallery);
    update();
  }

  onChange(select) {
    selectedItem = select;
    update();
  }


  createPost() async {
    var response = await ApiPostController().createPost(
        titleController.text, descriptionController.text, "1", file!.path);
    if (response) {
      Get.snackbar("Success", "Create Post Success",
          backgroundColor: Colors.green, margin: const EdgeInsets.all(10));
    } else {
      Get.snackbar("Error", "Failed to create post, try again",
          backgroundColor: Colors.red, margin: const EdgeInsets.all(10));
    }
    descriptionController.text = "";
    titleController.text = "";
    update();
  }

  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
    titleController.dispose();
    if (file != null) {
      File(file!.path).deleteSync();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
