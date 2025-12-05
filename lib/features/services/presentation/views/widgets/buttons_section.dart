import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:flutter/material.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: CustomButtonComponent(
            title: 'رجوع',
            titleStyle: Styles.textStyle20.copyWith(color: kBlue),
            color: Colors.white,
            border: Border.all(color: kBlue),
            borderRadius: 10,
          ),
        ),
        Expanded(
          child: CustomButtonComponent(
            title: 'متابعة',
            titleStyle: Styles.textStyle20.copyWith(color: Colors.white),
            borderRadius: 10,
          ),
        ),
      ],
    );
  }
}
