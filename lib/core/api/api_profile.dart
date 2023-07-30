import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_helper.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:http/http.dart' as http;
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/features/profile/model/profile.dart';
import 'package:world_peace/features/auth/view/screen/login_screen.dart';

class ApiProfileController with ApiHelper {
  Future<Profile> profilePage({required idUser}) async {
    final response = await http.get(
        Uri.parse(
          ApiSetting.profile(idUser),
        ),
        headers: headers);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Profile.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }

  Future<bool> editProfile(
      {required String name,
      required String email,
      required String mobile,
      dynamic image}) async {
    final url = Uri.parse(ApiSetting.editProfile);
    final request = http.MultipartRequest('POST', url);
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] = AppPreferences().token;
    if (image != null && image.isNotEmpty) {
      var file = await http.MultipartFile.fromPath('image', image);
      request.files.add(file);
    }

    request.fields['name'] = name;
    request.fields['mobile'] = mobile;
    request.fields['email'] = email;
    request.fields["image"] = image;
    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> logout() async {
    final response = await http.post(
        Uri.parse(
          ApiSetting.logout,
        ),
        headers: headers);
    if (response.statusCode == 200) {
      AppPreferences().removeData();
      Get.offAll(const LoginScreen());
      return true;
    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }
}
