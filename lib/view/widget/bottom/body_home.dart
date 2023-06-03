import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/api/api_post.dart';
import 'package:world_peace/core/constant/image.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        margin: const EdgeInsets.all(5),
        child: FutureBuilder(
          future: ApiPostController().readPost(pageNumber: 1),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: Text("No Internet Connection !"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (snapshot.hasData &&
                snapshot.data!.data!.data!.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  controller.refreshData();
                },
                child: ListView.builder(
                    itemCount: snapshot.data!.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10).r,
                          border: Border.all(
                              color: const Color(0xffe9e9e9), width: 1.w),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage(ImageUrl.person1),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot
                                          .data!.data!.data![index].user!.name
                                          .toString(),
                                      style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      snapshot.data!.data!.data![index]
                                          .createdAtFormatted
                                          .toString(),
                                      style: GoogleFonts.montserrat(
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                InkWell(
                                  child: Text(snapshot
                                      .data!.data!.data![index].status
                                      .toString()),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              snapshot.data!.data!.data![index].title!,
                              style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold, fontSize: 17.sp),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              snapshot.data!.data!.data![index].description!,
                              style: GoogleFonts.cairo(fontSize: 17.sp),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            const Divider(),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.addLike(
                                        snapshot.data!.data!.data![index].id!
                                            .toString(),
                                        index);
                                  },
                                  child: ImageIcon(
                                    const AssetImage(ImageUrl.like),
                                    color: controller.selectIndex == index
                                        ? controller.response
                                            ? controller.isLiked
                                                ? Colors.red
                                                : Colors.grey
                                            : const Color(0xffb5b5c4)
                                        : const Color(0xffb5b5c4),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  snapshot
                                      .data!.data!.data![index].likes!.length
                                      .toString(),
                                  style: const TextStyle(
                                    color: Color(0xffb5b5c4),
                                  ),
                                ),
                                const Spacer(),
                                const ImageIcon(
                                  AssetImage(ImageUrl.comment),
                                  color: Color(0xffb5b5c4),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Text(
                                  "276",
                                  style: TextStyle(
                                    color: Color(0xffb5b5c4),
                                  ),
                                ),
                                const Spacer(),
                                const ImageIcon(
                                  AssetImage(ImageUrl.share),
                                  color: Color(0xffb5b5c4),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Text(
                                  "195",
                                  style: TextStyle(
                                    color: Color(0xffb5b5c4),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              );
            } else {
              return const Center(child: Text("no data"));
            }
          },
        ),
      );
    });
  }
}
