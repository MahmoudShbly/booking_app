import 'package:booking_app/core/utlis/styles.dart';
import 'package:flutter/material.dart';

class AboutServiceSection extends StatelessWidget {
  const AboutServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'عيادة',
              style: Styles.textStyle20.copyWith(color: Colors.grey),
            ),
            Spacer(),
            Icon(Icons.star, color: Colors.amber),
            Text('4.5', style: Styles.textStyle20),
          ],
        ),
        const SizedBox(height: 15),
        Text('معالجة امراض الفم واللثة', style: Styles.textStyle26),
        const SizedBox(height: 15),
        Text(
          'تفاصيل العيادة',
          style: Styles.textStyle20.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 15),
        Text(
          'طبيب خريج جامعة دمشق و حاصل على دبلوم  في طب الاسنان وجراحتها',
          style: Styles.textStyle20,
        ),
      ],
    );
  }
}
