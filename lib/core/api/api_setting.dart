class ApiSetting {
  ApiSetting._();
  static const String baseUrl =
      'https://aqsacommuinty.health-optima.com/mobile/api/';
  static const String login = '${baseUrl}auth/login';
  static const String register = '${baseUrl}auth/register';
  static const String createPost = '${baseUrl}posts/create';
  static const String readCategories = "${baseUrl}posts/all/categories";
  static const String sendLike="${baseUrl}likes/action";
  static String readPostByPage(int id) {
    return "${baseUrl}posts/all?page=$id";
  }
}
