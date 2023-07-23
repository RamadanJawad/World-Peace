import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_post.dart';
import 'package:world_peace/model/post.dart';

class HomeController extends GetxController {
  TextEditingController updateComments = TextEditingController();
  TextEditingController comment = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool response = false;
  int page = 1;
  ObjectPost objectPost = ObjectPost();
  List<Posts> post = [];
  bool isLoading = false;
  bool isLoadingMore = false;
  int item = 0;

  refreshData() async {
    post.clear();
    await readPost();
    update();
  }

  Future<void> readPost() async {
    objectPost =
        await ApiPostController().readPost(pageNumber: page, post: post);
    post.addAll(objectPost.posts!);
    isLoading = true;
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
      await refreshData();
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
    post.clear();
    isLoading = false;
    await readPost();
    update();
  }

  scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoadingMore = true;
      page = page + 1;
      readPost();
      isLoadingMore = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    readPost();
    scrollController.addListener(scrollListener);
  }
}
