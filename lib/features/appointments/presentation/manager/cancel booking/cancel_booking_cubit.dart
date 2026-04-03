import 'package:booking_app/features/appointments/data/models/booking_model.dart';
import 'package:booking_app/features/appointments/data/repos/booking_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cancel_booking_state.dart';

class CancelBookingCubit extends Cubit<CancelBookingState> {
  CancelBookingCubit(this.bookingRepo) : super(CancelBookingInitial());
  final BookingRepoImpl bookingRepo;
  Future<void> cancelBooking(BookingModel booking) async {
    emit(CancelBookingLoading(bookingId: booking.id));
    var result = await bookingRepo.cancelBooking(booking);
    result.fold(
      (failure) =>
          emit(CancelBookingFailure(errorMessage: failure.errorMessage, bookingId: booking.id)),
      (success) => emit(CancelBookingSuccess(successMessage: success, bookingId: booking.id)),
    );
  }
}
