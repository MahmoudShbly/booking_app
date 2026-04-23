import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/pull_button_section.dart';
import 'package:flutter/material.dart';

class ProfitsCard extends StatelessWidget {
  const ProfitsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: <Color>[Color(0xFF113D6E), Color.fromARGB(244, 30, 76, 129),Color(0xFF1A3A5F)],
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'اجمالي النقاط',
                    style: Styles.textStyle14.copyWith(
                      color: Color(0xff87a4cfcc),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text.rich(
                    TextSpan(
                      text: '1200',
                      style: Styles.textStyle30.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: ' نقطة',
                          style: Styles.textStyle14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          PullButtonSection(),
        ],
      ),
    );
  }
}
