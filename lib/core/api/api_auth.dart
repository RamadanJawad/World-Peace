import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/core/widget/custom_snack_bar.dart';
import 'package:world_peace/features/auth/model/user.dart';
import 'package:http/http.dart' as http;

class ApiAuthController {
  Future<User?> login({required String email, required String password}) async {
    var response = await http.post(Uri.parse(ApiSetting.login), body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse["status"] != false) {
        var jsonData = jsonResponse["data"];
        User user = User.fromJson(jsonData);
        return user;
      }
    } else {
      showCustomSnackBar(
          context: Get.context!,
          contentType: ContentType.failure,
          title: "Login failed!",
          message: "Login failed,please try again");
    }
    return null;
  }

  Future<bool?> register({
    required String email,
    required String name,
    required String password,
    required String mobile,
  }) async {
    var response = await http.post(Uri.parse(ApiSetting.register), body: {
      "name": name,
      "email": email,
      "password": password,
      "mobile": mobile,
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] != false) {
        return true;
      }
    }
    return false;
  }
}
