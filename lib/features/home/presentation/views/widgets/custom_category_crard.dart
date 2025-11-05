import 'package:booking_app/core/utlis/constant.dart';
import 'package:flutter/material.dart';

class CustomCategoryCard extends StatelessWidget {

  const CustomCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {  

    return Container(
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
        
      ),
      child: AspectRatio(aspectRatio: 1.7),
      
    );
  }
}
