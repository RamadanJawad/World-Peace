import 'package:world_peace/core/api/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:world_peace/core/api/api_setting.dart';

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
      print(response.statusCode);
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }
}
