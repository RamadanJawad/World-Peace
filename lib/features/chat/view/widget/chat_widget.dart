import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/features/chat/controller/message_controller.dart';

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
                : AppColor.primaryColor,
            borderRadius: controller.cacheData.getUserId().toString() != id
                ? const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))
                : const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
          ),
          child: Text(
            message,
            style: GoogleFonts.cairo(fontSize: 16.sp, color: Colors.white),
          ),
        ),
      );
    });
  }
}
