import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20service%20reviews/fetch_service_reviews_cubit.dart';
import 'package:booking_app/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.service});
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator( 
        onRefresh: () async {
          context.read<FetchServiceReviewsCubit>().fetchServiceReviews(
            service.id,
          );
        },
        child: Stack(
          children: [
            Column(
              children: [Expanded(child: DetailsViewBody(service: service))],
            ),
          ],
        ),
      ),
    );
  }
}
