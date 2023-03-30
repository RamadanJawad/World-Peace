import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/model/user.dart';
import 'package:http/http.dart' as http;

class ApiAuthController {
  Future<User?> login({required String email, required String password}) async {
    var response = await http.post(Uri.parse(ApiSetting.login), body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if(jsonResponse['status'] == false){
        Get.snackbar("Login failed!", "Login failed,please try again",
          backgroundColor: Colors.red);
      }
      var jsonData = jsonResponse['data'];
      User user = User.fromJson(jsonData);
      return user;
    }
    return null;
  }

  Future<User?> register({
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
      var jsonResponse = jsonDecode(response.body);
      if(jsonResponse['status'] == false){
        Get.snackbar("Entry error", "The data you entered already exists, please try again",
          backgroundColor: Colors.red);
      }
      var jsonData = jsonResponse['data'];
      User user = User.fromJson(jsonData);
      return user;
    }
    return null;
  }
}
