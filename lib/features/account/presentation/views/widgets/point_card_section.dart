import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/account/presentation/views/widgets/point_request_button.dart';
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
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: <Color>[
            Color(0xFF2F63A6),
            Color(0xff002759),
            Color(0xFF002759),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            spreadRadius: 3,
            offset: const Offset(5, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'نقاطي',
                    style: Styles.textStyle12.copyWith(
                      color: Colors.grey.shade200,
                    ),
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
                ],
              ),
              Spacer(),
              Container(
                height: 64,
                width: 64,

                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white.withValues(alpha: 0.2),
                ),
                child: Icon(Icons.stars, color: Color(0xff8BF1E6), size: 30),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(57, 189, 189, 189),
                  ),
                  child: Center(
                    child: Text(
                      'رصيدك الحالي: 10 ل.س',
                      style: Styles.textStyle12.copyWith(
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 25),
              PointRequestButton(),
            ],
          ),
        ],
      ),
    );
  }
}
