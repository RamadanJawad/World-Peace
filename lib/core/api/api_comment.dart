import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:world_peace/core/api/api_helper.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/model/commentes.dart';

class ApiCommentController with ApiHelper {
  Future<Comments> readComments({required int postId}) async {
    final response = await http.get(
      Uri.parse(ApiSetting.readComments(postId)),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Comments.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }

  Future createComment({required String comment, required int postId}) async {
    final response = await http.post(
      Uri.parse(ApiSetting.createComments(postId)),
      body: {"description": comment, "status": "1"},
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future deleteComment({required postId, required commentId}) async {
    final response = await http.delete(
        Uri.parse(ApiSetting.deleteComment(postId, commentId)),
        headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future updateComment(
      {required int commentId,
      required int postId,
      required String updateComment}) async {
    final response = await http.post(
        Uri.parse(ApiSetting.updateComment(commentId)),
        body: {
          "description": updateComment,
          "post_id": postId.toString(),
          "status": "1"
        },
        headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
