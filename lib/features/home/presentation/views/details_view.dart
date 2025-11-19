
import 'package:booking_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:booking_app/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
    
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(child: SingleChildScrollView(child: DetailsViewBody())),
        ],
      ),
    );
  }
}