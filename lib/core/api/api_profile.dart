import 'dart:convert';
import 'package:world_peace/core/api/api_helper.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:http/http.dart' as http;
import 'package:world_peace/model/profile.dart';

class ApiProfileController with ApiHelper {
  Future<Profile> profilePage({required idUser}) async {
    final response = await http.get(
        Uri.parse(
          ApiSetting.profile(idUser),
        ),
        headers: headers);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      var jsonObject = jsonData["user"];
      return Profile.fromJson(jsonObject);
    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }
}
