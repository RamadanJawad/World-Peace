import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';

class FeatureLike extends StatelessWidget {
  final int postId;
  final int likeCount;
  final int index;
  final int? likePost;
  final void Function()? onTap;

  const FeatureLike({
    Key? key,
    required this.postId,
    required this.likeCount,
    required this.index,
    this.likePost,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Row(
        children: [
          InkWell(
              onTap: onTap,
              child: Icon(CupertinoIcons.heart_fill,
                  size: 28,
                  color: index == postId
                      ? likePost == 1
                          ? AppColor.primaryColor
                          : Colors.grey
                      : Colors.grey)),
          SizedBox(
            width: 5.w,
          ),
          Text(
            likeCount.toString(),
            style: const TextStyle(
              color: Color(0xffb5b5c4),
            ),
          ),
        ],
      );
    });
  }
}
