import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/home/presentation/views/widgets/custom_review_card.dart';
import 'package:flutter/material.dart';

class ReviewRatingSection extends StatelessWidget {
  const ReviewRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'التعليقات',
          style: Styles.textStyle20.copyWith(color: Colors.grey),
        ),
        SizedBox(height: 12),
        ListView.separated(
          separatorBuilder: (context, index) =>
              Container(height: 1, color: Colors.grey.shade300),
          itemBuilder: (context, index) => CustomReviewCard(),
          itemCount: 3,
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}

