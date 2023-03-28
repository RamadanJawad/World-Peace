import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/splashController.dart';
import 'package:world_peace/core/constant/image.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            FadeTransition(
              opacity: controller.curve,
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      ImageUrl.logo,
                      height: 120.h,
                    ),
                    Text(
                      "AqsaCommunity",
                      style: GoogleFonts.ubuntu(fontSize: 25.sp),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            const Spacer(),
            const CupertinoActivityIndicator(
              color: Colors.grey,
            )
          ],
        ),
      )
    );
  }
}
