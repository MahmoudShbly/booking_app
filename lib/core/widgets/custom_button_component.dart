import 'package:booking_app/core/utlis/constant.dart';
import 'package:flutter/material.dart';

class CustomButtonComponent extends StatelessWidget {
   const CustomButtonComponent({
    super.key,
     this.borderRadius=0,
    required this.title,
     this.width=double.infinity,
     this.height=50,
     this.titleStyle,
     this.color = kBlue,
  });
  final double borderRadius;
  final double width;
  final double height;
  final String title;
  final TextStyle? titleStyle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(child: Text(title, style: titleStyle)),
      ),
    );
  }
}
