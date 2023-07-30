import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/features/auth/model/user.dart';
import 'package:http/http.dart' as http;

class ApiAuthController {
  Future<User?> login({required String email, required String password}) async {
    var response = await http.post(Uri.parse(ApiSetting.login), body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data'];
      User user = User.fromJson(jsonResponse);
      return user;
    } else {
      Get.snackbar("Login failed!", "Login failed,please try again",
          backgroundColor: Colors.red);
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
      print(response.statusCode);
      return true;
    }
    print(response.statusCode);
    return false;
  }
}
