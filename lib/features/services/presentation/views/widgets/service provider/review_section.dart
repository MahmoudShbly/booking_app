import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/data/repos/service%20provider/provider_repo_impl.dart';
import 'package:booking_app/features/services/presentation/manager/service%20provider/fetch%20service%20provider%20reviews/fetch_provider_service_reviews_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key, required this.serviceId});
  final int serviceId;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FetchProviderServiceReviewsCubit(ProviderRepoImpl())
            ..fetchProviderServiceReviews(serviceId: serviceId),
      child: BlocBuilder<FetchProviderServiceReviewsCubit, FetchProviderServiceReviewsState>(
        builder: (context, state) {
          if (state is FetchProviderServiceReviewsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FetchProviderServiceReviewsFailure) {
            return Center(
              child: Text(
                state.message,
                style: Styles.textStyle12.copyWith(color: Colors.red),
              ),
            );
          }

          if (state is FetchProviderServiceReviewsSuccess &&
              state.reviews.isNotEmpty) {
                final cubit = context.read<FetchProviderServiceReviewsCubit>();
            final reviewStats = state.reviews.first;
            final firstComment = reviewStats.comments.isNotEmpty
                ? reviewStats.comments.first
                : null;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'اراء المراجعين',
                  style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    border: BoxBorder.all(color: Colors.grey),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 35),
                  // margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4EADB),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Icon(
                                  Icons.star_rounded,
                                  size: 18,
                                  color: Color(0xFFD9A441),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  reviewStats.average.toStringAsFixed(1),
                                  style: Styles.textStyle20.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF002446),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  cubit.ratingLabel(reviewStats.average),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.textStyle12.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'بناء على ${reviewStats.count} تقييم',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.textStyle12.copyWith(
                                    color: const Color(0xFF8A93A0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () => GoRouter.of(context).push(AppRouter.kReviewDetailsView, extra: reviewStats),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'التفاصيل',
                                    style: Styles.textStyle12.copyWith(
                                      color: const Color(0xFF606A78),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right_rounded,
                                    size: 16,
                                    color: Color(0xFF606A78),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      if (firstComment != null)
                        ReviewCard(
                          reviewerName: firstComment.userName,
                          reviewText: firstComment.comment,
                          rating: firstComment.stars,
                        )
                      else
                        Text(
                          'لا توجد تعليقات بعد',
                          style: Styles.textStyle12.copyWith(
                            color: const Color(0xFF8A93A0),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
