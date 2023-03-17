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
      margin: EdgeInsets.all(5),
      child: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10).r,
                  border: Border.all(color: Colors.grey, width: 1.w)),
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
                  Divider(),
                  Row(
                    children: [
                      ImageIcon(AssetImage(controller.data[index]['icon1'])),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(controller.data[index]['like']),
                      Spacer(),
                      ImageIcon(AssetImage(controller.data[index]['icon2'])),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(controller.data[index]['comment']),
                      Spacer(),
                      ImageIcon(AssetImage(controller.data[index]['icon3'])),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(controller.data[index]['share'])
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
