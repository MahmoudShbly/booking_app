

import 'package:booking_app/features/appointments/data/models/review_model.dart';
import 'package:booking_app/features/services/data/repos/service%20provider/provider_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_provider_service_reviews_state.dart';

class FetchProviderServiceReviewsCubit extends Cubit<FetchProviderServiceReviewsState> {
  FetchProviderServiceReviewsCubit(this.providerRepo)
    : super(FetchProviderServiceReviewsInitial());

  final ProviderRepo providerRepo;

  Future<void> fetchProviderServiceReviews({required int serviceId}) async {
    emit(FetchProviderServiceReviewsLoading());

    final result = await providerRepo.fetchProviderServiceReview(
      serviceId: serviceId,
    );

    result.fold(
      (failure) => emit(
        FetchProviderServiceReviewsFailure(message: failure.errorMessage),
      ),
      (reviews) => emit(FetchProviderServiceReviewsSuccess(reviews: reviews)),
    );
  }
}
