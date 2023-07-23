import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/notification_controller.dart';
import 'package:world_peace/core/api/api_notification.dart';
import 'package:world_peace/core/constant/color.dart';

class BodyNotification extends StatelessWidget {
  const BodyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (controller) {
        return SizedBox(
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
                return ListView.separated(
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Row(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                snapshot.data!.data![index].data!.body
                                    .toString(),
                                style: GoogleFonts.cairo(fontSize: 17.sp),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.acceptFollow(snapshot
                                          .data!.data![index].data!.userId
                                          .toString());
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.primaryColor),
                                    child: Text(
                                      "accept",
                                      style: GoogleFonts.cairo(
                                          fontSize: 15.sp, color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.rejectFollow(snapshot
                                          .data!.data![index].data!.userId
                                          .toString());
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColor.backgroundColor),
                                    child: Text(
                                      "reject",
                                      style: GoogleFonts.cairo(
                                          fontSize: 15.sp,
                                          color: AppColor.primaryColor),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      );
                    });
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
