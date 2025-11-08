import 'package:flutter/material.dart';
import 'package:booking_app/core/utlis/constant.dart';



class CustomAppBarComponent extends StatelessWidget {
  const CustomAppBarComponent({super.key,required this.myWidget});
  final Widget myWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: myWidget,
      ),
    );
  }
}
