import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AdminAppBarSection extends StatelessWidget {
  const AdminAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'حجوزاتي',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
        Text(
          'لوحة التحكم الرئيسية',
          style: Styles.textStyle24.copyWith(fontWeight: FontWeight.bold),
        ),
        Text('نظرة عامة على أداء نظام حجوزاتي اليوم', style: Styles.textStyle16),
      ],
    );
  }
}
