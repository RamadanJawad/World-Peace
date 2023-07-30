import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/features/home/controller/home_controller.dart';
import 'package:world_peace/core/cache/cache.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/features/profile/view/screen/my_profile_screen.dart';
import 'package:world_peace/features/profile/view/screen/profile_screen.dart';

class FeaturePost extends StatelessWidget {
  final int index;
  final int userId;
  final String name;
  final String createdAtFormatted;
  final String title;
  final String description;
  final String image;
  final List? images;
  final String category;
  final Widget? child;

  const FeaturePost({
    Key? key,
    required this.index,
    required this.userId,
    required this.name,
    required this.createdAtFormatted,
    required this.description,
    required this.title,
    required this.image,
    this.images,
    required this.category, this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(image),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (userId == AppPreferences().userId!) {
                              Get.to(
                                () => const MyProfileScreen(),
                              );
                            } else {
                              CacheData cacheData = CacheData();
                              cacheData.setUserId(userId);
                              Get.to(
                                () => const ProfilePage(),
                              );
                            }
                          },
                          child: Text(
                            name.toString(),
                            style:
                                GoogleFonts.cairo(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      createdAtFormatted.toString(),
                      style: GoogleFonts.montserrat(
                          color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).r,
                    border: Border.all(
                      color: AppColor.primaryColor.withOpacity(0.7),
                    ),
                  ),
                  child: Text(
                    category,
                    style: GoogleFonts.cairo(),
                  ),
                ),
                SizedBox(
                  width: AppPreferences().userId == userId ? 5 : null,
                ),
                SizedBox(
                  width: AppPreferences().userId == userId ? 15 : null,
                  child: AppPreferences().userId == userId ? child : null,
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              title,
              style: GoogleFonts.cairo(
                  fontWeight: FontWeight.bold, fontSize: 17.sp),
            ),
            Text(
              description,
              style: GoogleFonts.cairo(fontSize: 17.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: double.infinity,
              height: images!.isEmpty ? 0 : 260,
              child: images!.isNotEmpty && images!.length == 1
                  ? Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              images![0],
                              width: 400.w,
                              fit: BoxFit.cover,
                            )),
                      ))
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: images!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  images![index],
                                  width: 250.w,
                                  fit: BoxFit.cover,
                                  height: images!.isNotEmpty ? 240.h : 0,
                                )),
                          ),
                        );
                      }),
            )
          ],
        );
      },
    );
  }
}
