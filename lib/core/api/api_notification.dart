import 'dart:convert';
import 'package:world_peace/core/api/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/model/notification.dart';

class ApiNotificationController with ApiHelper {
  Future<Notifications> readNotification({required List notifications}) async {
    var response =
        await http.get(Uri.parse(ApiSetting.notification), headers: headers);
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      notifications = jsonObject['notifications'];
      // var jsonArray = jsonObject['notifications'];
      // Notifications notification = Notifications.fromJson(jsonArray);
      return Notifications.fromJson(jsonObject);
    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }
}
