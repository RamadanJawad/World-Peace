import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_helper.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:http/http.dart' as http;
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/model/edit_profile.dart';
import 'package:world_peace/model/profile.dart';
import 'package:world_peace/view/screen/auth/login_screen.dart';

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

  Future<EditProfileResponse> editProfile({
    required String name,
    required String email,
    required String mobile,
  }) async {
    final response = await http
        .post(Uri.parse(ApiSetting.editProfile), headers: headers, body: {
      "name": name,
      "mobile": mobile,
      "email": email,
    });
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      Get.snackbar("Success", "The data has been modified successfully",
          backgroundColor: Colors.green, margin: const EdgeInsets.all(10));
      return EditProfileResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch data from the API');
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
