import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:world_peace/core/api/api_chat.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/features/chat/model/message.dart';

class MessageController extends GetxController {
  CacheData cacheData = CacheData();
  List<DataMessage> messages = [];
  Message message = Message();
  TextEditingController messageController = TextEditingController();

  sendMessage() async {
    await ApiChatController().sendMessage(
        id: cacheData.getUserId().toString(), message: messageController.text);
    await readData();
    update();
  }

  readData() async {
    message =
        await ApiChatController().readChat(cacheData.getUserId().toString());
    messages = message.data!.data!;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    readData();
  }
}
