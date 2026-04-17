import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/review_card.dart';
import 'package:flutter/material.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'اراء المراجعين',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        Container(
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: BoxBorder.all(color: Colors.grey)
         
          ),
          padding: EdgeInsets.symmetric(horizontal: 21,vertical: 35),
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4EADB),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(
                          Icons.star_rounded,
                          size: 18,
                          color: Color(0xFFD9A441),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '4.9',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF002446),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
              
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'تقييم ممتاز',
                        style: Styles.textStyle12.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'بناء على 3 تقييم',
                        style: Styles.textStyle12.copyWith(
                          color: const Color(0xFF8A93A0),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F3F5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'التفاصيل',
                          style: Styles.textStyle12.copyWith(
                            color: const Color(0xFF606A78),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right_rounded,
                          size: 16,
                          color: Color(0xFF606A78),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ReviewCard(),
            ],
          ),
        ),
      ],
    );
  }
}
