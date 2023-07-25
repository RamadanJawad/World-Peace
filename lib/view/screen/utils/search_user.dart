import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/search_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/view/widget/utils/custom_field.dart';

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
        body: GetBuilder<SearchUserController>(
          init: SearchUserController(),
          builder: (controller) {
            return Column(
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
                        ? ListView.builder(
                            itemCount: controller.searchUser.length,
                            itemBuilder: (context, index) {
                              return Text(
                                controller.searchUser[index].name!,
                                style: GoogleFonts.cairo(
                                    fontSize: 20.sp, color: Colors.black),
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
            );
          },
        ),
      ),
    );
  }
}
