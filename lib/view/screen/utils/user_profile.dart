import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.message_sharp),
            ),
          )
        ],
        title: Text(
          "My Profile",
          style: GoogleFonts.cairo(fontSize: 20.sp, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200.h,
            color: AppColor.primaryColor,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(ImageUrl.person2),
                  radius: 35.r,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Ashley Graham",
                  style:
                      GoogleFonts.cairo(fontSize: 18.sp, color: Colors.white),
                ),
                Text(
                  "ashley_graham@gmail.com",
                  style:
                      GoogleFonts.cairo(fontSize: 17.sp, color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Follow"),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15).r),
                    backgroundColor: AppColor.primaryColor,
                    elevation: 0,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
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
                                backgroundImage: AssetImage(ImageUrl.person2),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ashley Graham",
                                    style: GoogleFonts.cairo(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.data[index]['time'],
                                    style: GoogleFonts.montserrat(
                                        color: Colors.grey),
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
                              ImageIcon(
                                  AssetImage(controller.data[index]['icon1'])),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(controller.data[index]['like']),
                              Spacer(),
                              ImageIcon(
                                  AssetImage(controller.data[index]['icon2'])),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(controller.data[index]['comment']),
                              Spacer(),
                              ImageIcon(
                                  AssetImage(controller.data[index]['icon3'])),
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
            ),
          )
        ],
      ),
    );
  }
}
