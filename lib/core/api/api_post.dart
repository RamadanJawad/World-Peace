import 'package:http/http.dart' as http;
import 'package:world_peace/core/api/api_helper.dart';
import 'package:world_peace/core/api/api_setting.dart';

class ApiPostController with ApiHelper {
  Future<bool> createPost(
      {required String description, String? imagePath}) async {
    var response = await http.post(Uri.parse(ApiSetting.createPost),
        body: {
          "title": "test",
          "description": description,
          "category_id": "1",
          "status": "1",
          "image": ""
        },
        headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
