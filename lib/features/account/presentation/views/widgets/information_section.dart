import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Mahmoud Alshbly',
          style: Styles.textStyle40.copyWith(
            color: kBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'shbly1029@gmail.com',
          style: Styles.textStyle16.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
