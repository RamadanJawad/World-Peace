import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_comment.dart';
import 'package:world_peace/core/api/api_post.dart';
import 'package:world_peace/core/constant/image.dart';

class HomeController extends GetxController {
  TextEditingController updateComments = TextEditingController();
  TextEditingController comment = TextEditingController();
  bool isLiked = false;
  int? selectIndex;
  bool response = false;

  refreshData() async {
    await ApiPostController().readPost(pageNumber: 1);
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
  void addComment(int postId) async {
    response = await ApiCommentController()
        .createComment(comment: comment.text, postId: postId);
    if (response) {
      Get.snackbar("Success", "Create comment Success",
          backgroundColor: Colors.green, margin: const EdgeInsets.all(10));
      update();
    } else {
      Get.snackbar("Error", "Failed to comment, try again",
          backgroundColor: Colors.red, margin: const EdgeInsets.all(10));
    }
    comment.text = "";
    update();
  }

  void deleteComment({required int postId, required commentId}) async {
    var response = await ApiCommentController()
        .deleteComment(postId: postId, commentId: commentId);
    if (response) {
      Get.snackbar("Success", "delete comment Success",
          backgroundColor: Colors.green, margin: const EdgeInsets.all(10));
      update();
    } else {
      Get.snackbar("Error", "Failed delete comment, try again",
          backgroundColor: Colors.red, margin: const EdgeInsets.all(10));
    }
    update();
  }

  void updateComment({
    required int commentId,
    required int postId,
  }) async {
    response = await ApiCommentController().updateComment(
        commentId: commentId,
        postId: postId,
        updateComment: updateComments.text);
    update();

    if (response) {
      Get.snackbar("Success", "update commnet Success",
          backgroundColor: Colors.green, margin: const EdgeInsets.all(10));
    } else {
      Get.snackbar("Error", "Failed to update commnet, try again",
          backgroundColor: Colors.red, margin: const EdgeInsets.all(10));
    }
    update();
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

  void addLike(String postId, int index) async {
    selectIndex = index;
    response = await ApiPostController().sendLike(postId: postId);
    if (response) {
      isLiked = !isLiked;
      update();
    }
    update();
  }

  List<Map<String, dynamic>> data = [
    {
      "icon": ImageUrl.person1,
      "icon1": ImageUrl.like,
      "chat": "Hey, how it is going?",
      "icon2": ImageUrl.comment,
      "icon3": ImageUrl.share,
      "name": "Heather Clark",
      "time": "3 days ago .",
      "like": "2.3K",
      "share": "195",
      "comment": "276",
      "post":
          "Interacting with someone you don't like Do not try to get upset when they try to provoke you."
    },
    {
      "icon": ImageUrl.person2,
      "icon1": ImageUrl.like,
      "icon2": ImageUrl.comment,
      "icon3": ImageUrl.share,
      "chat": "Hey, how it is going?",
      "name": "Ashley Graham",
      "time": "5 days ago .",
      "like": "1.5K",
      "share": "100",
      "comment": "300",
      "post":
          "Although routine may enhance our sense of safety and security, change is very necessary."
    },
    {
      "icon": ImageUrl.person3,
      "icon1": ImageUrl.like,
      "icon2": ImageUrl.comment,
      "icon3": ImageUrl.share,
      "chat": "Hey, how it is going?",
      "name": "Thitiwat Shimma",
      "time": "8 days ago .",
      "like": "1K",
      "share": "50",
      "comment": "120",
      "post":
          "We love her at the end of the world, we go to her first, and she does not like her hip-hop."
    },
    {
      "icon": ImageUrl.person4,
      "icon1": ImageUrl.like,
      "icon2": ImageUrl.comment,
      "icon3": ImageUrl.share,
      "chat": "Hey, how it is going?",
      "name": "Diana Malewic",
      "time": "10 minutes ago .",
      "like": "3M",
      "share": "700",
      "comment": "4000",
      "post":
          "Interacting with someone you don't like Do not try to get upset when they try to provoke you."
    },
    {
      "icon": ImageUrl.person5,
      "icon1": ImageUrl.like,
      "icon2": ImageUrl.comment,
      "icon3": ImageUrl.share,
      "chat": "Hey, how it is going?",
      "name": "Justas Galaburda",
      "time": "30 minutes ago .",
      "like": "27K",
      "share": "300",
      "comment": "600",
      "post":
          "Use all my words to open the path of goodness. You will not be able to. Our thoughts will not reach us."
    },
  ];

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }
}
