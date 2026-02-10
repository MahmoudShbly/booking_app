import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_location_component.dart';
import 'package:booking_app/features/home/presentation/views/widgets/cost_section.dart';
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
            Text('عيادة الرضوان', style: Styles.textStyle26),
            Spacer(),
            Icon(Icons.star, color: Colors.amber),
            Text('4.5', style: Styles.textStyle20),
          ],
        ),
        const SizedBox(height: 15),
        CustomLocationComponent(location: 'حمص - الكراج الشمالي'),
        const SizedBox(height: 20),
        CostSection(),
        const SizedBox(height: 15),
        Text(' الوصف', style: Styles.textStyle26),
        const SizedBox(height: 15),
        Text(
          'عيادة سنية مختصة في معالجة امراض الفم واللثة',
          style: Styles.textStyle18,
        ),
      ],
    );
  }
}

