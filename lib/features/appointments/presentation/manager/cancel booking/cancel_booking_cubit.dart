import 'package:booking_app/features/appointments/data/repos/booking_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cancel_booking_state.dart';

class CancelBookingCubit extends Cubit<CancelBookingState> {
  CancelBookingCubit(this.bookingRepo) : super(CancelBookingInitial());
  final BookingRepoImpl bookingRepo;
  Future<void> cancelBooking(int bookingId) async {
    emit(CancelBookingLoading(bookingId: bookingId));
    var result = await bookingRepo.cancelBooking(bookingId);
    result.fold(
      (failure) =>
          emit(CancelBookingFailure(errorMessage: failure.errorMessage, bookingId: bookingId)),
      (success) => emit(CancelBookingSuccess(successMessage: success, bookingId: bookingId)),
    );
  }
}
