import 'dart:convert';
import 'package:world_peace/core/api/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/features/profile/model/follower.dart';

import '../../features/profile/model/following.dart';

class ApiFollowController with ApiHelper {
  Future<bool> follow(String userId) async {
    var response = await http.post(Uri.parse(ApiSetting.follow(userId)),
        body: {
          "user_id": userId,
        },
        headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> acceptFollow(String userId) async {
    var response = await http.post(Uri.parse(ApiSetting.acceptFollow(userId)),
        body: {
          "user_id": userId,
        },
        headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> rejectFollow(String userId) async {
    var response = await http.post(Uri.parse(ApiSetting.rejectFollow(userId)),
        body: {
          "user_id": userId,
        },
        headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> unFollow(String userId) async {
    var response = await http.post(Uri.parse(ApiSetting.unFollow(userId)),
        headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> removeFollow(String userId) async {
    var response = await http.post(Uri.parse(ApiSetting.removeFollow(userId)),
        headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Follower>> allFollower() async {
    var response =
        await http.post(Uri.parse(ApiSetting.allFollower), headers: headers);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      final jsonArray = jsonData["followers"] as List;
      return jsonArray.map((e) => Follower.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<Following>> allFollowing() async {
    var response =
        await http.post(Uri.parse(ApiSetting.allFollowing), headers: headers);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      final jsonArray = jsonData["following"] as List;
      return jsonArray.map((e) => Following.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
