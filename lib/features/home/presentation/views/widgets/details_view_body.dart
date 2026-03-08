import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:booking_app/features/home/presentation/views/widgets/about_service_section.dart';
import 'package:booking_app/features/home/presentation/views/widgets/review_rating_section.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.service});
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * .4,
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Image.network(
                service.images[index],
                width: size.width * 1,
                fit: BoxFit.cover,
              ),
            ),
            itemCount: service.images.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AboutServiceSection(service: service,),              
              const SizedBox(height: 26),
              ReviewRatingSection(),
              const SizedBox(height: 70),
             
            ],
          ),
        ),
      ],
    );
  }
}
