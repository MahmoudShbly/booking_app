import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TopBannerSection extends StatelessWidget {
  const TopBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('حجوزاتي', style: Styles.textStyle40),
          const SizedBox(height: 24),
          Text(
            'مرحباً بك في حجوزاتي ، حيث تحجز راحتك',
            style: Styles.textStyle18.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
