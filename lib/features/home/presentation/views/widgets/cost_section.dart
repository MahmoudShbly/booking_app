import 'package:booking_app/features/home/presentation/views/widgets/cost_box.dart';
import 'package:flutter/material.dart';

class CostSection extends StatelessWidget {
  const CostSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CostBox(title: 'تكلفة الحجز :', price: '3'),
        SizedBox(
          width: 15,
        ),
        CostBox(title: 'تكلفة الخدمة :', price: '23'),
      ],
    );
  }
}
