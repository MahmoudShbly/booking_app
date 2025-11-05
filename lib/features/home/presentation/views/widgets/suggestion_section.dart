import 'package:booking_app/core/utlis/styles.dart';
import 'package:booking_app/core/widgets/service_card_component.dart';
import 'package:flutter/material.dart';

class SuggestionSection extends StatelessWidget {
  const SuggestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('اقتراحات قد تعجبك :', style: Styles.textStyle26),
        const SizedBox(height: 18),
        ListView.builder(
          itemBuilder: (context, index) => const ServiceCardComponent(),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
        ),
      ],
    );
  }
}