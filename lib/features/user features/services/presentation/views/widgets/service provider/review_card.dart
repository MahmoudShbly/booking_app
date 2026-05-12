import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    this.reviewerName = 'فهد الحربي',
    this.reviewText = 'الخدمة ممتازة والدكتور دقيق في المواعيد ومهني جدًا. انصح به بشدة.',
    this.rating = 5,
  });

  final String reviewerName;
  final String reviewText;
  final int rating;

  @override
  Widget build(BuildContext context) {
    final int clampedRating = rating.clamp(0, 5);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Color(0xFFDDE5EE),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 14,
                        color: Color(0xFF3E5368),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: Text(
                        reviewerName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle12.copyWith(
                          color: Color(0xFF1C2A39),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsetsDirectional.only(end: 1),
                      child: Icon(
                        index < clampedRating ? Icons.star : Icons.star_border,
                        size: 12,
                        color: const Color(0xFFF4A21D),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            reviewText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle12.copyWith(
              color: Color(0xFF6E7B8A),
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}