import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/utils/temp.dart';
import 'package:booking_app/features/home/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({super.key, required this.category});
  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kCategoriesView),
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
            
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(Temp.tempImage2, fit: BoxFit.cover),
              ),
            ),
             Positioned(top: 50,right: 50,child: Text(category.name,style: Styles.textStyle24.copyWith(color: Colors.white),),)
          ],
        ),
      ),
    );
  }
}
