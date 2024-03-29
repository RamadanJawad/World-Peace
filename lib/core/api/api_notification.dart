import 'dart:convert';
import 'package:world_peace/core/api/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:world_peace/core/api/api_setting.dart';
import 'package:world_peace/features/notifications/model/notification.dart';

class ApiNotificationController with ApiHelper {
  Future<Notifications> readNotification() async {
    var response =
        await http.get(Uri.parse(ApiSetting.notification), headers: headers);
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      var jsonArray = jsonObject['notifications_unread'];
      Notifications notification = Notifications.fromJson(jsonArray);
      return notification;
    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }
}
