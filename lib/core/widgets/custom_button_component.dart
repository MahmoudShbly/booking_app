import 'package:booking_app/core/utils/constant.dart';
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
     this.onTap,
     this.border,
  });
  final double borderRadius;
  final double width;
  final double height;
  final String title;
  final TextStyle? titleStyle;
  final Color color;
  final void Function()?onTap;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: border,
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(child: Text(title, style: titleStyle)),
      ),
    );
  }
}
