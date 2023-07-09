import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/constant/image.dart';

class FeatureLike extends StatelessWidget {
  final int postId;
  final int likeCount;
  final int index;

  const FeatureLike({
    Key? key,
    required this.postId,
    required this.likeCount,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.addLike(postId.toString(), index);
            },
            child: ImageIcon(const AssetImage(ImageUrl.like),
                color: controller.selectIndex == index
                    ? controller.isLiked
                        ? Colors.red
                        : Colors.grey
                    : const Color(0xffb5b5c4)),
          ),
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
