import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20service%20reviews/fetch_service_reviews_cubit.dart';
import 'package:booking_app/features/home/presentation/views/widgets/about_service_section.dart';
import 'package:booking_app/features/home/presentation/views/widgets/review_rating_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.service});
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<FetchServiceReviewsCubit, FetchServiceReviewsState>(
      builder: (context, state) {
        final cubit = context.read<FetchServiceReviewsCubit>();
        if (state is FetchServiceReviewsSuccess)
{        return Column(
          children: [
            SizedBox(
              height: size.height * .4,
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: CachedNetworkImage(
                    imageUrl: service.images[index],
                    width: size.width * 1,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey.shade300),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.error, color: Colors.red),
                    ),
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
                  AboutServiceSection(service: service,average: state.reviews.average.toString(),),
                  const SizedBox(height: 26),
                  ReviewRatingSection(feedbacks: state.reviews.comments,),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ],
        );}
        else if (state is FetchServiceReviewsFailure) {
          return Center(child: Text(state.message));
        }
        else {
          cubit.fetchServiceReviews(service.id);
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
