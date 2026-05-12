import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key,required this.title});
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
  TextSpan(
    text: title, 
    style: Styles.textStyle26.copyWith(color: kBlue), 
    children: [
      TextSpan(
        text: '*',
        style: Styles.textStyle26.copyWith(color: Color(0xffCD1111)),
      ),
      TextSpan(
        text: ':',
        style: Styles.textStyle26.copyWith(color: kBlue),
      ),
    ],
  ),
  textDirection: TextDirection.rtl,
);
  }
}