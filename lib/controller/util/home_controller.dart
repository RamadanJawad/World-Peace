import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_comment.dart';
import 'package:world_peace/core/api/api_post.dart';

class HomeController extends GetxController {
  TextEditingController updateComments = TextEditingController();
  TextEditingController comment = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool response = false;
  int page = 1;

  refreshData() async {
    await ApiPostController().readPost(pageNumber: page);
    update();
  }

  refreshCommentData(int postId) async {
    await ApiCommentController().readComments(postId: postId);
    update();
  }

  void onSelected(select, id) {
    switch (select) {
      case 0:
        deletePost(postId: id);
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }

  void deletePost({required int postId}) async {
    var response = await ApiPostController().deletePost(postId: postId);
    if (response) {
      Get.snackbar("Success", "delete post Success",
          backgroundColor: Colors.green, margin: const EdgeInsets.all(10));
      update();
    } else {
      Get.snackbar("Error", "Failed delete post, try again",
          backgroundColor: Colors.red, margin: const EdgeInsets.all(10));
    }

    update();
  }

  void addLike(String postId) async {
    response = await ApiPostController().sendLike(postId: postId);
    if (response) {
      update();
    }
    update();
  }

  scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page = page + 1;
      await ApiPostController().readPost(pageNumber: page);
      update();
    }
    if (scrollController.position.pixels ==
        scrollController.position.minScrollExtent) {
      page = page - 1;
      await ApiPostController().readPost(pageNumber: page);
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    refreshData();
    scrollController.addListener(scrollListener);
  }
}
