import 'package:booking_app/core/utlis/styles.dart';
import 'package:booking_app/core/utlis/temp.dart';
import 'package:booking_app/features/home/presentation/views/widgets/rating.dart';
import 'package:flutter/material.dart';

class CustomReviewCard extends StatelessWidget {
  const CustomReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(child: Image.asset(Temp.tempImage)),
              SizedBox(width: 12),
              const Text('محمود الشلبي', style: Styles.textStyle20),
              Spacer(),
              Rating(starCount: 4),
            ],
          ),
          Text(
            'عيادة رائعة لكن يخرج الطبيب مسرعا ولا ياخذ استشارات تبا له',
            style: Styles.textStyle20.copyWith(fontWeight: FontWeight.normal),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
