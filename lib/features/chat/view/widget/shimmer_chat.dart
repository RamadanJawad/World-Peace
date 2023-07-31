import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Shimmer getShimmerChatLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(0.1),
    highlightColor: Colors.grey.withOpacity(0.2),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xffe9e9e9), width: 1.w),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 15.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border:
                        Border.all(color: const Color(0xffe9e9e9), width: 1.w),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xffe9e9e9), width: 1.w),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 15.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border:
                        Border.all(color: const Color(0xffe9e9e9), width: 1.w),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xffe9e9e9), width: 1.w),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 15.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border:
                        Border.all(color: const Color(0xffe9e9e9), width: 1.w),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xffe9e9e9), width: 1.w),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 15.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border:
                        Border.all(color: const Color(0xffe9e9e9), width: 1.w),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xffe9e9e9), width: 1.w),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 15.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border:
                        Border.all(color: const Color(0xffe9e9e9), width: 1.w),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
