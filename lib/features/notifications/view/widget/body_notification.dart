import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/features/notifications/controller/notification_controller.dart';
import 'package:world_peace/core/api/api_notification.dart';
import 'package:world_peace/core/constant/color.dart';
import '../../../../core/constant/image.dart';

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
                      separatorBuilder: (context, index) => Container(),
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 110.h,
                          margin:
                              const EdgeInsets.only(top: 10, left: 5, right: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5.w)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ]),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.acceptFollow(
                                          snapshot
                                              .data!.data![index].data!.userId
                                              .toString(),
                                          snapshot.data!.data![index].id!
                                              .toString());
                                      controller.refreshData();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.primaryColor),
                                    child: Text(
                                      "accept",
                                      style: GoogleFonts.cairo(
                                          fontSize: 16.sp, color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.rejectFollow(
                                          snapshot
                                              .data!.data![index].data!.userId
                                              .toString(),
                                          snapshot.data!.data![index].id!
                                              .toString());

                                      controller.refreshData();
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
                        );
                      }),
                );
              } else {
                return const Center(
                    child: Text(
                  "There are no notifications yet",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ));
              }
            },
          ),
        );
      },
    );
  }
}
