import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomCategoryCardShimmer extends StatelessWidget {
  const CustomCategoryCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Stack(
          children: [
            /// صورة الكارد
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(color: Colors.white),
              ),
            ),

            /// مكان النص
            Positioned(
              top: 50,
              child: Container(height: 24, width: 120, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
