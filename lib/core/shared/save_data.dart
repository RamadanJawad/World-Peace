import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_peace/model/user.dart';

class AppPreferences {
  static AppPreferences? _instance;
  late SharedPreferences sharedPreferences;
  AppPreferences._();

  factory AppPreferences() {
    return _instance ??= AppPreferences._();
  }

  Future initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future save(User user) async {
    await sharedPreferences.setBool("isLogged", true);
    await sharedPreferences.setString("name", user.name!);
    await sharedPreferences.setString("image", user.image!);
    await sharedPreferences.setString("email", user.email!);
    await sharedPreferences.setInt("user_id", user.id!);
    await sharedPreferences.setString("token", "Bearer ${user.token}");
  }

  int? get userId => sharedPreferences.getInt("user_id");

  String get name => sharedPreferences.getString("name") ?? "";

  String get userImage => sharedPreferences.getString("image") ?? "";

  bool get loggedIn => sharedPreferences.getBool("isLogged") ?? false;

  String get token => sharedPreferences.getString("token") ?? "";
  
  void removeData() async {
    await sharedPreferences.clear();
  }
}
