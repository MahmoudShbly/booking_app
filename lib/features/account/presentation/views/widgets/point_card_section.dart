import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PointCardSection extends StatelessWidget {
  const PointCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: kBlue,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            spreadRadius: 3,
            offset: const Offset(5, 10),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'نقاطي',
                style: Styles.textStyle12.copyWith(color: Colors.grey.shade200),
              ),
              const SizedBox(height: 12),
              Text(
                '120 نقطة',
                style: Styles.textStyle30.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(57, 189, 189, 189),
                ),
                child: Text(
                  'رصيدك الحالي 1200 ل.س',
                  style: Styles.textStyle12.copyWith(
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            height: 64,
            width: 64,

            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.2),
              ),
            child: Icon(Icons.stars, color: Color(0xff8BF1E6), size: 30)),
        ],
      ),
    );
  }
}
