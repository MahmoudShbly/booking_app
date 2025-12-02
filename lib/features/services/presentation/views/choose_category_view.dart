import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/features/services/presentation/views/widgets/category_selection_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/title_section.dart';
import 'package:flutter/material.dart';

class ChooseCategoryView extends StatelessWidget {
  const ChooseCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleSection(title: 'اختر نوع الخدمة التي تود تقديمها'),
          SizedBox(height: 50),
          CategorySelectionSection(),
          CustomButtonComponent(title: "التالي"),
        ],
      ),
    );
  }
}

