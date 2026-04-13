import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            color: kBlue,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 24),
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          'أهلاً، د. أحمد',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: kBlue,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.settings, color: Colors.white, size: 24),
        ),
      ],
    );
  }
}
