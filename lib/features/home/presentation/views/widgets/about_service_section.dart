import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_location_component.dart';
import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:booking_app/features/home/presentation/views/widgets/cost_section.dart';
import 'package:flutter/material.dart';

class AboutServiceSection extends StatelessWidget {
  const AboutServiceSection({super.key, required this.service,required this.average});
  final ServiceModel service;
  final String average;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(service.name, style: Styles.textStyle26),
            Spacer(),
            Icon(Icons.star, color: Colors.amber),
            Text(average, style: Styles.textStyle20),
          ],
        ),
        const SizedBox(height: 15),
        CustomLocationComponent(location: service.location, city: service.city),
        const SizedBox(height: 20),
        CostSection(bookingPrice: service.bookPrice, price: service.fullPrice),
        const SizedBox(height: 15),
        Text(' الوصف', style: Styles.textStyle26),
        const SizedBox(height: 15),
        Text(
          service.description,
          style: Styles.textStyle18,
        ),
      ],
    );
  }
}

