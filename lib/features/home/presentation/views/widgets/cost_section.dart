import 'package:booking_app/features/home/presentation/views/widgets/cost_box.dart';
import 'package:flutter/material.dart';

class CostSection extends StatelessWidget {
  const CostSection({super.key, required this.price, required this.bookingPrice});
  final String price;
  final String bookingPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CostBox(title: 'تكلفة الحجز :', price: bookingPrice),
        SizedBox(
          width: 15,
        ),
        CostBox(title: 'تكلفة الخدمة :', price: price),
      ],
    );
  }
}
