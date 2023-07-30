import 'dart:convert';

import 'package:world_peace/core/api/api_helper.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/features/chat/model/message.dart';
import 'package:world_peace/features/chat/model/user_chat.dart';
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

  Future<Message> readChat(String id) async {
    final response =
        await http.get(Uri.parse(ApiSetting.singleUser(id)), headers: headers);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Message.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }

  Future<bool> sendMessage(
      {required String id, required String message}) async {
    final response = await http
        .post(Uri.parse(ApiSetting.sendMessage), headers: headers, body: {
      "received_id": id,
      "message": message,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }
}
