import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/home_controller.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Container(
      margin: const EdgeInsets.all(5),
      child: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(color: const Color(0xffe9e9e9), width: 1.w),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(controller.data[index]['icon']),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.data[index]['name'],
                            style:
                                GoogleFonts.cairo(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            controller.data[index]['time'],
                            style: GoogleFonts.montserrat(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(controller.data[index]['post']),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Divider(),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage(controller.data[index]['icon1']),
                        color: const Color(0xffb5b5c4),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        controller.data[index]['like'],
                        style: const TextStyle(
                          color: Color(0xffb5b5c4),
                        ),
                      ),
                      const Spacer(),
                      ImageIcon(
                        AssetImage(controller.data[index]['icon2']),
                        color: const Color(0xffb5b5c4),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        controller.data[index]['comment'],
                        style: const TextStyle(
                          color: Color(0xffb5b5c4),
                        ),
                      ),
                      const Spacer(),
                      ImageIcon(
                        AssetImage(controller.data[index]['icon3']),
                        color: const Color(0xffb5b5c4),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        controller.data[index]['share'],
                        style: const TextStyle(
                          color: Color(0xffb5b5c4),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
