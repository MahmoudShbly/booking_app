import 'package:booking_app/core/utlis/app_router.dart';
import 'package:booking_app/core/utlis/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCategoryCard extends StatelessWidget {

  const CustomCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {  

    return GestureDetector(
        onTap: () => GoRouter.of(context).push(AppRouter.kCategoriesView),
      child: Container(
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kBlue,
          
        ),
        child: AspectRatio(aspectRatio: 1.6),
        
      ),
    );
  }
}
