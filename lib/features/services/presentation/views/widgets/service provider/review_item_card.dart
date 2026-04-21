import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/appointments/data/models/feedback_model.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/review_stars_row.dart';
import 'package:flutter/material.dart';

class ReviewItemCard extends StatelessWidget {
  const ReviewItemCard({
    super.key,
    required this.item,
  });

  final FeedbackModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9E2EC),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  color: Color(0xFF234A73),
                  size: 22,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                 
                    Text(
                      item.userName,
                      style: Styles.textStyle14.copyWith(
                        color: const Color(0xFF1D2630),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    ReviewStarsRow(rating: item.stars, size: 16),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.comment,
            style: Styles.textStyle14.copyWith(
              color: const Color(0xFF5F6B77),
              
            ),
          ),
        ],
      ),
    );
  }
}
