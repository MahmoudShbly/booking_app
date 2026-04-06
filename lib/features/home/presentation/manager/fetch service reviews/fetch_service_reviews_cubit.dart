import 'package:booking_app/features/appointments/data/models/review_model.dart';
import 'package:booking_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_service_reviews_state.dart';

class FetchServiceReviewsCubit extends Cubit<FetchServiceReviewsState> {
  FetchServiceReviewsCubit(this.homeRepo) : super(FetchServiceReviewsInitial());

  final HomeRepoImpl homeRepo;

  Future<void> fetchServiceReviews(int id) async {
    emit(FetchServiceReviewsLoading());
    final result = await homeRepo.fetchServiceReviews(id);
    result.fold(
      (failure) => emit(FetchServiceReviewsFailure(message: failure.errorMessage)),
      (reviews) => emit(FetchServiceReviewsSuccess(reviews: reviews)),
    );
  }
}
