import 'dart:convert';
import 'package:world_peace/core/api/api_helper.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/model/search_user.dart';
import 'package:http/http.dart' as http;

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
}
