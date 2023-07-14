class ApiSetting {
  ApiSetting._();
  static const String baseUrl =
      'https://aqsacommuinty.health-optima.com/mobile/api/';
  static const String login = '${baseUrl}auth/login';
  static const String register = '${baseUrl}auth/register';
  static const String createPost = '${baseUrl}posts/create';
  static const String readCategories = "${baseUrl}posts/all/categories";
  static const String sendLike = "${baseUrl}likes/action";
  static const String notification = "${baseUrl}notifications/myNotification";
  static const String logout = "${baseUrl}auth/logout";

  static String readPostByPage(int id) {
    return "${baseUrl}posts/all?page=$id";
  }

  static String readComments(int idPost) {
    return "${baseUrl}comments/all/$idPost";
  }

  static String createComments(int idPost) {
    return "${baseUrl}comments/create/$idPost";
  }

  static String deleteComment(int idPost, int idComment) {
    return "${baseUrl}comments/delete/$idPost/$idComment";
  }

  static String updateComment(int idComment) {
    return "${baseUrl}comments/update/$idComment";
  }

  static String deletePost(int idPost) {
    return "${baseUrl}posts/delete/$idPost";
  }

  static String profile(int idUser) {
    return "${baseUrl}profile/$idUser";
  }

  static String follow(String userId) {
    return "${baseUrl}follows/follow";
  }

  static String unFollow(String userId) {
    return "${baseUrl}follows/unFollow/$userId";
  }

  static String acceptFollow(String userId) {
    return "${baseUrl}follows/acceptFollow";
  }

  static String rejectFollow(String userId) {
    return "${baseUrl}follows/rejectFollow/$userId";
  }

  static String removeFollow(String userId) {
    return "${baseUrl}follows/removeFollow/$userId";
  }
}
