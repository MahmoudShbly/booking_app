import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/account/presentation/views/widgets/bottom_sheet_input.dart';
import 'package:flutter/material.dart';

class PointRequestFormContent extends StatelessWidget {
  const PointRequestFormContent({
    super.key,
    required this.pointsController,
    required this.transferIdController,
  });

  final TextEditingController pointsController;
  final TextEditingController transferIdController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xffEDF1F5),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            'ملاحظة: قيمة كل 10 نقاط = 10 ل.س\nسيتم مراجعة طلبك خلال 24 ساعة.',
            textAlign: TextAlign.center,
            style: Styles.textStyle12.copyWith(
              color: const Color(0xff4F5D73),
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'عدد النقاط المطلوبة',
          textAlign: TextAlign.right,
          style: Styles.textStyle12.copyWith(color: const Color(0xff4F5D73)),
        ),
        const SizedBox(height: 6),
        BottomSheetInput(
          hintText: 'ادخل عدد النقاط',
          icon: Icons.radio_button_unchecked,
          controller: pointsController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        Text(
          'معرّف التحويل',
          textAlign: TextAlign.right,
          style: Styles.textStyle12.copyWith(color: const Color(0xff4F5D73)),
        ),
        const SizedBox(height: 6),
        BottomSheetInput(
          hintText: 'ادخل رقم عملية التحويل',
          icon: Icons.receipt_long_outlined,
          controller: transferIdController,
        ),
      ],
    );
  }
}
