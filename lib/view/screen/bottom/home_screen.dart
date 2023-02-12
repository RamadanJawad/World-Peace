import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/view/widget/bottom/body_home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/home_controller.dart';
import 'package:world_peace/core/constant/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColor.primaryColor.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
        elevation: 0,
        title: Text(
          "World Speace",
          style: GoogleFonts.cairo(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: BodyHome(),
    );
  }
}
