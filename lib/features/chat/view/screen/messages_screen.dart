import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/features/chat/controller/message_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';
import '../widget/chat_widget.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
        init: MessageController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.primaryColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              title: Text(
                controller.cacheData.getUserName(),
                style: GoogleFonts.cairo(fontSize: 20.sp, color: Colors.white),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageUrl.backgroundImage),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: controller.messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ChatWidget(
                                id: controller.messages[index].senderId
                                    .toString(),
                                message: controller.messages[index].message!),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.messageController,
                            decoration: InputDecoration(
                                hintText: 'Type your message...',
                                contentPadding: const EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            String text = controller.messageController.text;
                            if (text.trim().isNotEmpty) {
                              controller.sendMessage();
                              controller.messageController.clear();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
