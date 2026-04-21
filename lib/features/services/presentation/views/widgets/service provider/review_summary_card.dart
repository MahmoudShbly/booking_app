import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/review_stars_row.dart';
import 'package:flutter/material.dart';

class ReviewSummaryCard extends StatelessWidget {
  const ReviewSummaryCard({
    super.key,
    required this.averageRating,
    required this.totalReviews,
  });

  final double averageRating;
  final int totalReviews;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: <Color>[Color(0xFF113D6E), Color.fromARGB(216, 30, 76, 129),Color(0xFF1A3A5F)],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: <Widget>[
          Text(
            'التقييم العام',
            style: Styles.textStyle16.copyWith(
              color: const Color(0xFFD2DDEA),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 32.0,
              ),
              Text(
                averageRating.toStringAsFixed(1),
                style: Styles.textStyle60
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 32
                  ),
                  const ReviewStarsRow(rating: 5, size: 18),
                  const SizedBox(height: 4),
                  Text(
                    'بناءً على $totalReviews تقييمات',
                    style: Styles.textStyle12.copyWith(
                      color: const Color(0xFFC9D6E5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
