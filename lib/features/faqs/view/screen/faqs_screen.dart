import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:world_peace/features/faqs/controller/faq_controller.dart';
import 'package:world_peace/features/faqs/view/widget/body_faq.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FAQController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQS',
          style: GoogleFonts.cairo(fontSize: 20.sp, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageUrl.backgroundImage), fit: BoxFit.fill),
        ),
        child: const BodyFAQ(),
      ),
    );
  }
}
