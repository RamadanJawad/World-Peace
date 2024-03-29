import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/features/home/controller/home_controller.dart';
import 'package:world_peace/features/search/view/screen/search_by_category.dart';
import 'package:world_peace/features/home/view/widget/body_home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        title: Text(
          "World Speace",
          style: GoogleFonts.cairo(color: Colors.white, fontSize: 20.sp),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.to(
                  () => const SearchByCategory(),
                );
              },
              icon: const Icon(
                CupertinoIcons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: const BodyHome(),
    );
  }
}
