import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_search.dart';
import 'package:world_peace/model/search_user.dart';

class SearchUserController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<SearchOfUser> searchUser = [];

  Future<void> getUser() async {
    searchUser = await ApiSearch().searchUser(searchController.text);
    update();
  }

  onChange(String value) {
    if (searchController.text == "") {
      searchUser = [];
      update();
    }
    getUser();
    update();
  }
}
