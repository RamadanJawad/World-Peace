import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
        elevation: 0,
        title: Text(
          "Chats",
          style: GoogleFonts.cairo(fontSize: 20.sp, color: Colors.black),
        ),
      ),
      
    );
  }
}
