import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_search.dart';
import 'package:world_peace/features/search/model/search_user.dart';
import '../../../core/api/api_post.dart';
import '../../post/model/category.dart';
import '../../home/model/post.dart';

class SearchCategoryController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final jobRoleDropdownCtrl = TextEditingController();
  List<String> categories = ["All"];
  List<Categories> category = [];
  List<SearchOfUser> searchUser = [];
  ObjectPost objectPost = ObjectPost();
  List<Posts> post = [];
  bool response = false;
  bool isLoading = false;
  bool isLoadingMore = false;
  bool isPressed = false;
  ScrollController scrollController = ScrollController();
  int page = 1;
  String selectedItem = '';
  int categoryId = 1;

  onChangeItem(select) {
    selectedItem = select;
    for (int i = 0; i < category.length; i++) {
      if (category[i].name.toString() == selectedItem.toString()) {
        categoryId = category[i].id!;
      }
    }
    post.clear();
    update();
  }

  getCategory() async {
    category = await ApiPostController().readCategories();
    for (int i = 0; i < category.length; i++) {
      categories.add(category[i].name!.toString());
    }
    update();
  }

  Future<void> getCategoryPost() async {
    objectPost = await ApiSearch().searchCategory(
      pageNumber: page,
      categoryId: categoryId,
      post: post,
    );
    post.addAll(objectPost.posts!);
    isLoading = true;
    update();
  }

  void addLike(String postId) async {
    response = await ApiPostController().sendLike(postId: postId);
    post.clear();
    isLoading = false;
    await getCategoryPost();
    update();
  }


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

  @override
  void onInit() {
    super.onInit();
    getCategoryPost();
    getCategory();
  }
}
