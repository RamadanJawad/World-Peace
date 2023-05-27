import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:world_peace/core/api/api_helper.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/model/post.dart';

class ApiPostController with ApiHelper {
  Future<bool> createPost(String title, String description, String category,
      String imageFile) async {
    final url = Uri.parse(ApiSetting.createPost);
    final request = http.MultipartRequest('POST', url);
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] = AppPreferences().token;
    var file = await http.MultipartFile.fromPath('image', imageFile);
    request.files.add(file);
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['category_id'] = category;
    request.fields['status'] = "1";
    final response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<ObjectPost> readPost({required int pageNumber}) async {
    final response = await http.get(
      Uri.parse(ApiSetting.readPostByPage(pageNumber)),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ObjectPost.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch data from the API');
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
}
