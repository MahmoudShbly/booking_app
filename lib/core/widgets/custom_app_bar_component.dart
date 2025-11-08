import 'package:flutter/material.dart';
import 'package:booking_app/core/utlis/constant.dart';



class CustomAppBarComponent extends StatelessWidget {
  const CustomAppBarComponent({super.key,required this.myWidget});
  final Widget myWidget;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
            automaticallyImplyLeading: false,

            backgroundColor: kBlue,
            expandedHeight: 100, 
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: myWidget,
              ),
            ),
          );
  }
}
