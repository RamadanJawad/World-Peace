import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/auth/changePasswordController.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/view/widget/auth/bodyChangePassword.dart';


class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    ChangePasswordController controller = Get.put(ChangePasswordController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: GoogleFonts.cairo(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData.fallback(),
        centerTitle: true,
      ),
      body: const BodyChangePassword(),
    );
  }
}