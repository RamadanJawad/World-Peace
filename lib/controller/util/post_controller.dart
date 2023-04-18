import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_post.dart';

class PostController extends GetxController {
  TextEditingController descriptionController = TextEditingController();

  createPost() async {
    var response = await ApiPostController()
        .createPost(description: descriptionController.text);
    if (response) {
      Get.snackbar("Success", "Create Post Success",
          backgroundColor: Colors.green, margin:const EdgeInsets.all(10));
    }else{
      Get.snackbar("Error", "Failed to create post, try again",
          backgroundColor: Colors.red, margin:const EdgeInsets.all(10));
    }
    descriptionController.text = "";
    update();
  }
}
