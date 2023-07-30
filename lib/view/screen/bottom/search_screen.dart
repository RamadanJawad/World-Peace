import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/search_controller.dart';
import 'package:world_peace/core/constant/color.dart';

import '../../../core/constant/image.dart';
import '../../widget/home/feature_comment.dart';
import '../../widget/home/feature_like.dart';
import '../../widget/home/feature_post.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchCategoryController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Search ",
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
            child: Column(children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomDropdown(
                        hintText: 'Category Type',
                        listItemStyle:
                            GoogleFonts.cairo(color: AppColor.primaryColor),
                        selectedStyle: GoogleFonts.cairo(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        items: controller.categories,
                        hintStyle: GoogleFonts.cairo(fontSize: 17),
                        controller: controller.jobRoleDropdownCtrl,
                        excludeSelected: false,
                        borderRadius: BorderRadius.circular(10).r,
                        onChanged: (select) {
                          controller.onChangeItem(select);
                        },
                        fillColor:const Color.fromARGB(254, 241, 241, 241),
                        borderSide:const BorderSide(color: Colors.black12),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.selectedItem.isEmpty) {
                            Get.snackbar(
                                "Error", "You must choose Category Type",
                                backgroundColor: Colors.red,
                                margin: const EdgeInsets.all(10));
                          } else if (controller.post.isEmpty) {
                            Get.snackbar("No data found", "",
                                backgroundColor: Colors.red,
                                margin: const EdgeInsets.all(10));
                          } else {
                            controller.onTap();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5).r),
                        ),
                        child: Text(
                          "search",
                          style: GoogleFonts.cairo(fontSize: 19.5.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: controller.isPressed
                      ? Container(
                          margin: const EdgeInsets.all(5),
                          width: double.infinity,
                          child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount: controller.isLoadingMore
                                ? controller.post.length + 1
                                : controller.post.length,
                            itemBuilder: (context, index) {
                              if (index < controller.post.length) {
                                return Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 218, 217, 217),
                                        offset: Offset(1, 2),
                                        blurRadius: 3,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10).r,
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 218, 217, 217),
                                        width: 1.w),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FeaturePost(
                                        images: controller.post[index].images!,
                                        index: index,
                                        userId:
                                            controller.post[index].user!.id!,
                                        name:
                                            controller.post[index].user!.name!,
                                        category: controller
                                            .post[index].category!.name!,
                                        createdAtFormatted: controller
                                            .post[index].createdAtFormatted!,
                                        postId: controller.post[index].id!,
                                        description:
                                            controller.post[index].description!,
                                        title: controller.post[index].title!,
                                        image:
                                            controller.post[index].user!.image!,
                                      ),
                                      const Divider(),
                                      Row(
                                        children: [
                                          FeatureLike(
                                            postId: controller.post[index].id!,
                                            likeCount: controller
                                                .post[index].likesCount!,
                                            likePost: controller
                                                .post[index].likesPost!,
                                            index: controller.post[index].id!,
                                            onTap: () {
                                              controller.addLike(controller
                                                  .post[index].id
                                                  .toString());
                                            },
                                          ),
                                          const Spacer(),
                                          FeatureComment(
                                              index: index,
                                              postId: controller.post[index].id!
                                                  .toInt()),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              }
                            },
                          ),
                        )
                      : const Center(child: Text("")))

              // )
            ]),
          );
        },
      ),
    );
  }
}
