import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:booking_app/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.service});
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [Expanded(child: DetailsViewBody(service: service))],
          ),
        ],
      ),
    );
  }
}
