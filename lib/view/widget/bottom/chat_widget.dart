import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/controller/util/message_controller.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.id, required this.message});
  final String id;
  final String message;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(builder: (controller) {
      return Align(
        alignment: controller.cacheData.getUserId().toString() == id
            ? Alignment.topLeft
            : Alignment.topRight,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: controller.cacheData.getUserId().toString() == id
                ? Colors.orange
                : Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }
}
