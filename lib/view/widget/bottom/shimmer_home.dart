import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:world_peace/view/widget/bottom/shimmer_widget.dart';

Shimmer getShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(0.1),
    highlightColor: Colors.grey.withOpacity(0.2),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
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
