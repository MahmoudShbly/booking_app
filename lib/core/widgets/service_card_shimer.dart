import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ServiceCardShimmer extends StatelessWidget {
  const ServiceCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// صورة الخدمة
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(width: 16),

            /// النصوص
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// العنوان
                  Container(
                    height: 20,
                    width: double.infinity,
                    color: Colors.white,
                  ),

                  const SizedBox(height: 8),

                  /// الوصف سطر 1
                  Container(
                    height: 14,
                    width: double.infinity,
                    color: Colors.white,
                  ),

                  const SizedBox(height: 6),

                  /// الوصف سطر 2
                  Container(height: 14, width: 150, color: Colors.white),

                  const SizedBox(height: 10),

                  /// location
                  Container(height: 12, width: 120, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
