import 'package:booking_app/core/utlis/styles.dart';
import 'package:booking_app/core/widgets/service_card_component.dart';
import 'package:booking_app/features/home/presentation/views/widgets/category_section.dart';
import 'package:booking_app/features/home/presentation/views/widgets/suggestion_section.dart';
import 'package:flutter/material.dart';

class HomeBodySection extends StatelessWidget {
  const HomeBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CategorySection(),
            const SizedBox(height: 24),
            const SuggestionSection(),
          ],
        ),
      ),
    );
  }
}

