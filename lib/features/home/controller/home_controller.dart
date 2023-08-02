import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/api/api_post.dart';
import 'package:world_peace/features/home/model/post.dart';

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
    objectPost = await ApiPostController().readPost(pageNumber: 1, post: post);
    post.addAll(objectPost.posts!);
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
        Get.defaultDialog(
          title: "Delete Post!",
          middleText: "Are You Sure Delete This Post ?",
          cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, foregroundColor: Colors.white),
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Cancel",
              style: GoogleFonts.cairo(),
            ),
          ),
          confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () async {
              await deletePost(postId: id);
            },
            child: Text(
              "Yes,Turn",
              style: GoogleFonts.cairo(),
            ),
          ),
        );
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }

  Future deletePost({required int postId}) async {
    var response = await ApiPostController().deletePost(postId: postId);
    if (response) {
      Get.back();
      await refreshData();
      Get.snackbar("Success", "The post has been successfully deleted",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.thumb_up_alt_rounded,
            color: Colors.white,
          ));
      update();
    } else {
      Get.snackbar("Failure", "Failed delete post, try again",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ));
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
    if (isLoadingMore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoadingMore = true;
      page = page + 1;
      await readPost();
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
