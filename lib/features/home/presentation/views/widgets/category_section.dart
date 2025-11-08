import 'package:booking_app/core/utlis/styles.dart';
import 'package:booking_app/features/home/presentation/views/widgets/custom_category_crard.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('الفئات :', style: Styles.textStyle26),
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: size.height * 0.11,
          child: ListView.builder(
            itemBuilder: (context, index) => CustomCategoryCard(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
          ),
        ),
      ],
    );
  }
  }
