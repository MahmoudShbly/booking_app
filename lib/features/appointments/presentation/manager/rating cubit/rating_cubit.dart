import 'package:booking_app/features/appointments/data/models/booking_model.dart';
import 'package:booking_app/features/appointments/data/models/rating_model.dart';
import 'package:booking_app/features/appointments/data/repos/booking_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit(this.bookingRepo) : super(RatingInitial());
  BookingRepoImpl bookingRepo;
  int stars = 0;
  final TextEditingController commentController = TextEditingController();
  void changeRate(index) {
    stars = index;
    emit(RatingChangedState());
  }

  Future<void> submitRating(BookingModel booking) async {
    emit(RatingLoadingState(bookingId: booking.id));
    final rating = RatingModel(
      comment: commentController.text,
      stars: stars.toString(),
    );
    var result = await bookingRepo.ratnigService(
      rating: rating,
      booking: booking,
    );
    result.fold(
      (failure) {
        emit(
          RatingFailureState(
            bookingId: booking.id,
            errorMessage: failure.errorMessage,
          ),
        );
        commentController.clear();
        stars = 0;
        emit(RatingInitial());
      },
      (successMessage) {
        emit(
          RatingSuccessState(
            bookingId: booking.id,
            successMessage: successMessage,
          ),
        );

        commentController.clear();
        stars = 0;
        emit(RatingInitial());
      },
    );
  }
}
