import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/features/faqs/controller/faq_controller.dart';

class BodyFAQ extends StatelessWidget {
  const BodyFAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FAQController>(
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  controller.isTapController();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  height: controller.isTapped ? 200.h : 65.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10).r,
                    border: Border.all(color: Colors.grey, width: 1.w),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "There are many variations of passages of\n Lorem Ipsum available?",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.tajawal(fontSize: 18.sp),
                          ),
                          const Spacer(),
                          Icon(
                            controller.isTapped
                                ? Icons.arrow_drop_up_rounded
                                : Icons.arrow_drop_down_rounded,
                            size: 35.w,
                            color: controller.isTapped
                                ? AppColor.primaryColor
                                : Colors.grey,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                            controller.isTapped
                                ? "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
                                : "",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.cairo()),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.isTapController1();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  height: controller.isTapped1 ? 200.h : 65.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10).r,
                    border: Border.all(color: Colors.grey, width: 1.w),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "There are many variations of passages of\n Lorem Ipsum available?",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.tajawal(fontSize: 18.sp),
                          ),
                          const Spacer(),
                          Icon(
                            controller.isTapped1
                                ? Icons.arrow_drop_up_rounded
                                : Icons.arrow_drop_down_rounded,
                            size: 35.w,
                            color: controller.isTapped1
                                ? AppColor.primaryColor
                                : Colors.grey,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                            controller.isTapped1
                                ? "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
                                : "",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.cairo()),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.isTapController2();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  height: controller.isTapped2 ? 200.h : 65.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10).r,
                    border: Border.all(color: Colors.grey, width: 1.w),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "There are many variations of passages of\n Lorem Ipsum available?",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.tajawal(fontSize: 18.sp),
                          ),
                          const Spacer(),
                          Icon(
                            controller.isTapped2
                                ? Icons.arrow_drop_up_rounded
                                : Icons.arrow_drop_down_rounded,
                            size: 35.w,
                            color: controller.isTapped2
                                ? AppColor.primaryColor
                                : Colors.grey,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                            controller.isTapped2
                                ? "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
                                : "",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.cairo()),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.isTapController3();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  height: controller.isTapped3 ? 200.h : 65.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10).r,
                    border: Border.all(color: Colors.grey, width: 1.w),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "There are many variations of passages of\n Lorem Ipsum available?",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.tajawal(fontSize: 18.sp),
                          ),
                          const Spacer(),
                          Icon(
                            controller.isTapped3
                                ? Icons.arrow_drop_up_rounded
                                : Icons.arrow_drop_down_rounded,
                            size: 35.w,
                            color: controller.isTapped3
                                ? AppColor.primaryColor
                                : Colors.grey,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                            controller.isTapped3
                                ? "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
                                : "",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.cairo()),
                      )
                    ],
                  ),
                ),
              ),
              
              InkWell(
                onTap: () {
                  controller.isTapController4();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  height: controller.isTapped4 ? 200.h : 65.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10).r,
                    border: Border.all(color: Colors.grey, width: 1.w),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "There are many variations of passages of\n Lorem Ipsum available?",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.tajawal(fontSize: 18.sp),
                          ),
                          const Spacer(),
                          Icon(
                            controller.isTapped4
                                ? Icons.arrow_drop_up_rounded
                                : Icons.arrow_drop_down_rounded,
                            size: 35.w,
                            color: controller.isTapped4
                                ? AppColor.primaryColor
                                : Colors.grey,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                            controller.isTapped4
                                ? "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
                                : "",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.cairo()),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
