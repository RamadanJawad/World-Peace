import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_comment.dart';
import 'package:world_peace/model/commentes.dart';

class CommentController extends GetxController {
  List<Comment> comments = [];
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
}
