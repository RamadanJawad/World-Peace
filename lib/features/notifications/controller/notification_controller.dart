import 'package:get/get.dart';
import 'package:world_peace/core/api/api_follow.dart';
import 'package:world_peace/core/api/api_notification.dart';

class NotificationController extends GetxController {
  void acceptFollow(var userId, String notificationId) async {
    bool? response =
        await ApiFollowController().acceptFollow(userId, notificationId);
    if (response) {
      update();
    }
  }

  void rejectFollow(var userId, String notificationId) async {
    bool? response =
        await ApiFollowController().rejectFollow(userId, notificationId);
    if (response) {
      update();
    }
  }

  refreshData() async {
    await ApiNotificationController().readNotification();
    update();
  }

  void deleteNotification() {}
}
