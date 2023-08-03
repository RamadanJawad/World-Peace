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
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse["status"] != false) {
        var jsonData = jsonResponse["data"];
        User user = User.fromJson(jsonData);
        return user;
      } else {
        Get.snackbar("Error of Login", "login failed , please try again",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
            icon: const Icon(
              Icons.thumb_up_off_alt_rounded,
              color: Colors.white,
            ));
        Navigator.pop(Get.context!);
      }
    } else {
      Get.snackbar("Error of Login", "login failed , please try again",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(
            Icons.thumb_up_off_alt_rounded,
            color: Colors.white,
          ));
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
      } else {
        Get.snackbar("Error of Create Account",
            "Create Account failed , please try again",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
            icon: const Icon(
              Icons.error,
              color: Colors.white,
            ));
      }
    }
    return false;
  }
}
