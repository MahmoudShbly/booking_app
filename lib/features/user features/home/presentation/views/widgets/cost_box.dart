import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CostBox extends StatelessWidget {
  const CostBox({super.key,required this.title ,required this.price});
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Colors.black),
          color: kLightBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(8),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
      
             Text(title,style: Styles.textStyle18,),
            SizedBox(
              height: 12,
            ),
             Text(price, style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),)
      
          ],
        ),
      ),
    );
  }
}