import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/features/home/controller/home_controller.dart';
import 'package:world_peace/core/api/api_comment.dart';
import 'package:world_peace/features/comments/model/commentes.dart';

class CommentController extends GetxController {
  List<Comment> comments = [];
  HomeController homeController = Get.find();
  bool response = false;
  TextEditingController comment = TextEditingController();
  TextEditingController updateComments = TextEditingController();

  refreshData(int postId) async {
    await ApiCommentController().readComments(postId: postId);
    update();
  }

  void deleteComment({required int postId, required commentId}) async {
    var response = await ApiCommentController()
        .deleteComment(postId: postId, commentId: commentId);
    if (response) {
      homeController.refreshData();
      Get.snackbar("Success", "delete comment Success",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.thumb_up_alt,
            color: Colors.white,
          ));
      update();
    } else {
      Get.snackbar("Error", "Failed delete comment, try again",
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
      homeController.refreshData();
      Get.back();
      update();
      Get.snackbar("Success", "update comment Success",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.thumb_up_alt,
            color: Colors.white,
          ));
    } else {
      Get.snackbar("Error", "Failed to update comment, try again",
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

  void addComment(int postId) async {
    response = await ApiCommentController()
        .createComment(comment: comment.text, postId: postId);
    if (response) {
      homeController.refreshData();
      Get.snackbar("Success", "Create comment Success",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.thumb_up_alt_rounded,
            color: Colors.white,
          ));
      update();
    } else {
      Get.snackbar("Error", "Failed to comment, try again",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ));
    }
    comment.text = "";
    update();
  }
}
