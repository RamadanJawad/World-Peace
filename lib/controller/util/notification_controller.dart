import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_follow.dart';
import 'package:world_peace/core/api/api_notification.dart';

import '../../model/notification.dart';

class NotificationController extends GetxController {
  Notifications notifications = Notifications();
  List<ObjectData> allNotification = [];

  refreshData() async {
    allNotification.clear();
    notifications = await ApiNotificationController()
        .readNotification(notifications: allNotification);
    allNotification.addAll(notifications.data!);
    update();
  }

  Future<void> readNotification() async {
    notifications = await ApiNotificationController()
        .readNotification(notifications: allNotification);
    allNotification.addAll(notifications.data!);
    update();
  }

  void acceptFollow(var userId) async {
    bool? response = await ApiFollowController().acceptFollow(userId);
    if (response) {
      print(true);
      update();
    }
  }

  void rejectFollow(var userId) async {
    bool? response = await ApiFollowController().rejectFollow(userId);
    if (response) {
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    readNotification();
  }
}
