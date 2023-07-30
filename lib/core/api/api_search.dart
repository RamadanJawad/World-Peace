import 'dart:convert';
import 'package:world_peace/core/api/api_helper.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/features/search/model/search_user.dart';
import 'package:http/http.dart' as http;

import '../../features/home/model/post.dart';

class ApiSearch with ApiHelper {
  Future<List<SearchOfUser>> searchUser(String query) async {
    final response = await http.get(Uri.parse(ApiSetting.searchUser(query)),
        headers: headers);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var jsonArray = jsonData["users"] as List;
      return jsonArray.map((e) => SearchOfUser.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<ObjectPost> searchCategory(
      {required int pageNumber,
      required int categoryId,
      required List post}) async {
    final response = await http.get(
        Uri.parse(ApiSetting.categoryPost(categoryId, pageNumber)),
        headers: headers);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      post = jsonData["posts"] + post;
      return ObjectPost.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }
}
