import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:world_peace/core/api/api_helper.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/model/post.dart';

class ApiPostController with ApiHelper {
  Future<bool> createPost({
    required String title,
    required String description,
    required String category,
    dynamic imageFile,
  }) async {
    final url = Uri.parse(ApiSetting.createPost);
    final request = http.MultipartRequest('POST', url);
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] = AppPreferences().token;
    if (imageFile != null && imageFile.isNotEmpty) {
      var file = await http.MultipartFile.fromPath('images', imageFile);
      request.files.add(file);
    }
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['category_id'] = category;
    request.fields['status'] = "1";
    request.fields["images"] = imageFile;
    final response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<ObjectPost> readPost(
      {required int pageNumber, required List post}) async {
    final response = await http.get(
      Uri.parse(ApiSetting.readPostByPage(pageNumber)),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      post = jsonData["posts"] + post;
      return ObjectPost.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }

  Future deletePost({required postId}) async {
    final response = await http.delete(Uri.parse(ApiSetting.deletePost(postId)),
        headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Category>> readCategories() async {
    final response = await http.get(Uri.parse(ApiSetting.readCategories));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final jsonArray = jsonData["data"] as List;
      return jsonArray.map((e) => Category.fromJson(e)).toList();
    }
    return [];
  }

  Future<bool> sendLike({required String postId}) async {
    final response = await http.post(Uri.parse(ApiSetting.sendLike),
        body: {"post_id": postId}, headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
