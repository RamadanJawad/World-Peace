import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/search_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/view/widget/utils/custom_field.dart';
import '../../../core/cache/cache.dart';
import '../../../core/constant/image.dart';
import '../bottom/profile_screen.dart';

class SearchUser extends StatelessWidget {
  const SearchUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.primaryColor,
          title: Text(
            "Search",
            style: GoogleFonts.cairo(fontSize: 20.sp, color: Colors.white),
          ),
        ),
        body: GetBuilder<SearchCategoryController>(
          init: SearchCategoryController(),
          builder: (controller) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageUrl.backgroundImage),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  customField(controller.searchController, "search of user",
                      (value) {
                    controller.onChange(value);
                  }),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: controller.searchUser.isNotEmpty
                          ? ListView.separated(
                              itemCount: controller.searchUser.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              controller
                                                  .searchUser[index].image!
                                                  .toString()),
                                          radius: 26.r,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            CacheData cacheData = CacheData();
                                            cacheData.setUserId(controller
                                                .searchUser[index].id!);
                                            Get.to(() => const ProfilePage(),
                                                transition: Transition.fade);
                                          },
                                          child: Text(
                                            controller.searchUser[index].name!,
                                            style: GoogleFonts.cairo(
                                                fontSize: 20.sp,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              })
                          : Center(
                              child: Text(
                                "No User Found!",
                                style: GoogleFonts.cairo(
                                    fontSize: 20.sp, color: Colors.black),
                              ),
                            ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
