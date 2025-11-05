import 'package:booking_app/features/home/presentation/views/widgets/category_section.dart';
import 'package:flutter/material.dart';

class HomeBodySection extends StatelessWidget {
  const HomeBodySection({super.key});

  @override
  Widget build(BuildContext context) {
   return Column(
      children: <Widget>[
        CategorySection()
      ],
    );
    
}

}