import 'package:booking_app/core/utlis/app_router.dart';
import 'package:booking_app/core/utlis/temp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kCategoriesView),
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Container(
          margin: EdgeInsets.only(left: 10),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(Temp.tempImage2, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
