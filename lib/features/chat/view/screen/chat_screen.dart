import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/features/chat/controller/chat_controller.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/features/chat/view/screen/messages_screen.dart';
import 'package:world_peace/features/chat/view/widget/shimmer_chat.dart';

import '../../../../core/constant/image.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Messages",
            style: GoogleFonts.cairo(fontSize: 20.sp, color: Colors.white),
          ),
        ),
        body: GetBuilder<ChatController>(builder: (controller) {
          if (controller.userChat.isNotEmpty) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageUrl.backgroundImage),
                    fit: BoxFit.cover),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                  itemCount: controller.userChat.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        CacheData cacheData = CacheData();
                        cacheData.setUserName(controller.userChat[index].name!);
                        cacheData.setUserId(controller.userChat[index].id!);
                        Get.to(() => const MessagesScreen());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  controller.userChat[index].image!),
                              radius: 25.r,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              controller.userChat[index].name!,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cairo(
                                  textStyle: const TextStyle(
                                      overflow: TextOverflow.ellipsis)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return getShimmerChatLoading();
          }
        }));
  }
}
