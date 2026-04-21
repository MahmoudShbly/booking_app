import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/review_details_view_body.dart';
import 'package:booking_app/features/appointments/data/models/review_model.dart';
import 'package:flutter/material.dart';

class ReviewDetailsView extends StatelessWidget {
  const ReviewDetailsView({super.key, required this.reviews});
  final ReviewModel reviews ;
  @override
  Widget build(BuildContext context) {
    // Force RTL to match the provided Arabic design regardless of app locale.
    return Scaffold(
      backgroundColor: const Color(0xFFE8EDE9),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: ReviewDetailsViewBody(reviews: reviews),
        ),
      ),
    );
  }
}
