import 'dart:convert';

import 'package:world_peace/core/api/api_helper.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/model/user_chat.dart';
import 'package:http/http.dart' as http;

class ApiChatController with ApiHelper {
  Future<List<UserChat>> readUserChat() async {
    final response =
        await http.get(Uri.parse(ApiSetting.userChat), headers: headers);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final jsonArray = jsonData["users"] as List;
      return jsonArray.map((e) => UserChat.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
