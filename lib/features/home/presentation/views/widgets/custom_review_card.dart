import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/utils/temp.dart';
import 'package:booking_app/features/appointments/data/models/feedback_model.dart';
import 'package:booking_app/features/home/presentation/views/widgets/rating.dart';
import 'package:flutter/material.dart';

class CustomReviewCard extends StatelessWidget {
  const CustomReviewCard({super.key,required this.feedback});
   final FeedbackModel feedback;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(child: Image.asset(Temp.tempImage)),
              SizedBox(width: 12),
               Text(feedback.userName, style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold)),
              Spacer(),
              Rating(starCount: feedback.stars),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              feedback.comment,
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.normal),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
