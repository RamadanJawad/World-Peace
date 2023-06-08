import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/api/api_post.dart';
import 'package:world_peace/view/widget/home/feature_comment.dart';
import 'package:world_peace/view/widget/home/feature_like.dart';
import 'package:world_peace/view/widget/home/feature_post.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.all(5),
          child: FutureBuilder(
            future: ApiPostController().readPost(pageNumber: 1),
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
                              FeaturePost(index: index, snapshot: snapshot),
                              const Divider(),
                              Row(
                                children: [
                                  FeatureLike(snapshot: snapshot, index: index),
                                  const Spacer(),
                                  FeatureComment(
                                      index: index,
                                      postId: snapshot
                                          .data!.data!.data![index].id!
                                          .toInt()),
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
      },
    );
  }
}
