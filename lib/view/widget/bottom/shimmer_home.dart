import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Shimmer getShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(0.1),
    highlightColor: Colors.grey.withOpacity(0.2),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              height: 210.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(color: const Color(0xffe9e9e9), width: 1.w),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              height: 210.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(color: const Color(0xffe9e9e9), width: 1.w),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              height: 210.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(color: const Color(0xffe9e9e9), width: 1.w),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              height: 210.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(color: const Color(0xffe9e9e9), width: 1.w),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
