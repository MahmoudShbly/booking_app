import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PointRequestHeader extends StatelessWidget {
  const PointRequestHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 74,
          width: 74,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xffE9EDF2),
          ),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kBlue,
            ),
            child: const Icon(Icons.stars_rounded, color: Colors.white),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'طلب نقاط',
          style: Styles.textStyle24.copyWith(
            color: kBlue,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
