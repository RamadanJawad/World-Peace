import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/editProfileController.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/view/widget/auth/bodyEditProfile.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: GoogleFonts.cairo(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData.fallback(),
        centerTitle: true,
      ),
      body: const BodyEditProfile(),
    );
  }
}
