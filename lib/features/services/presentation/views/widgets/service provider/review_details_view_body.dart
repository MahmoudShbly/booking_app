import 'package:booking_app/features/appointments/data/models/review_model.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/review_details_header.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/review_item_card.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/review_summary_card.dart';
import 'package:flutter/material.dart';

class ReviewDetailsViewBody extends StatelessWidget {
  const ReviewDetailsViewBody({super.key,required this.reviews});
    final ReviewModel reviews ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const ReviewDetailsHeader(),
        const SizedBox(height: 8),
        ReviewSummaryCard(
          averageRating: reviews.average,
          totalReviews: reviews.count,
        ),
        const SizedBox(height: 10),
        Expanded(
          // ListView keeps the UI scalable when reviews grow.
          child: ListView.separated(
            itemCount: reviews.comments.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return ReviewItemCard(
                item: reviews.comments[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
