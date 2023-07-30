import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:world_peace/core/widget/shimmer_widget.dart';

Shimmer getShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(0.1),
    highlightColor: Colors.grey.withOpacity(0.2),
    child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerWidget(),
            ShimmerWidget(),
            ShimmerWidget(),
            ShimmerWidget(),
          ],
        ),
      ),
    ),
  );
}
