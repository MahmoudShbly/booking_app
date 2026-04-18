import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/app_bar_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/bookings_management_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/profits_card.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/review_section.dart';
import 'package:flutter/material.dart';

// MVVM - View: Main service provider screen layout.
class ServiceProviderViewBody extends StatelessWidget {
  const ServiceProviderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const AppBarSection(),
              const SizedBox(height: 16),
              const ProfitsCard(),
              const SizedBox(height: 20),
              const BookingsManagementSection(),
              const SizedBox(height: 20),
              const ReviewSection(),
              const SizedBox(height: 26),
            ],
          ),
        ),
      ),
    );
  }
}
