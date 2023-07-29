import 'package:get/get.dart';
import 'package:world_peace/core/api/apr_chat.dart';
import 'package:world_peace/model/user_chat.dart';

class ChatController extends GetxController {
  List<UserChat> userChat = [];

  Future<void> readData() async {
    userChat = await ApiChatController().readUserChat();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    readData();
  }
}
