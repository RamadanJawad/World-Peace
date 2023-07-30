import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/notification_controller.dart';
import 'package:world_peace/core/api/api_notification.dart';
import 'package:world_peace/core/constant/color.dart';

import '../../../core/constant/image.dart';

class BodyNotification extends StatelessWidget {
  const BodyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (controller) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageUrl.backgroundImage), fit: BoxFit.fill),
          ),
          child: FutureBuilder(
            future: ApiNotificationController().readNotification(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(
                  child: Text("No Internet Connection !"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (snapshot.hasData) {
                return RefreshIndicator(
                  onRefresh: () async {
                    controller.refreshData();
                  },
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 115.h,
                          margin: const EdgeInsets.only(top: 10),
                          child: Card(
                            color: Color.fromARGB(255, 255, 255, 255),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            shadowColor: Color.fromARGB(255, 218, 217, 217),
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(snapshot
                                            .data!.data![index].data!.image
                                            .toString()),
                                        radius: 26.r,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        snapshot.data!.data![index].data!.body
                                            .toString(),
                                        style: GoogleFonts.cairo(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ]),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        controller.acceptFollow(snapshot
                                            .data!.data![index].data!.userId
                                            .toString());
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColor.primaryColor),
                                      child: Text(
                                        "accept",
                                        style: GoogleFonts.cairo(
                                            fontSize: 16.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        controller.rejectFollow(snapshot
                                            .data!.data![index].data!.userId
                                            .toString());

                                        // snapshot.data!.data!.removeAt(index);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColor.backgroundColor),
                                      child: Text(
                                        "reject",
                                        style: GoogleFonts.cairo(
                                            fontSize: 16.sp,
                                            color: AppColor.primaryColor),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return const Text("no data");
              }
            },
          ),
        );
      },
    );
  }
}
