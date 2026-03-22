import 'package:booking_app/features/appointments/data/models/booking_model.dart';
import 'package:booking_app/features/appointments/data/repos/booking_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_my_bookings_state.dart';

class FetchMyBookingsCubit extends Cubit<FetchMyBookingsState> {
  FetchMyBookingsCubit(this.bookingRepo) : super(FetchMyBookingsInitial());
  final BookingRepoImpl bookingRepo;
  
  Future<void> fetchMyBookings() async {
    emit(FetchMyBookingsLoading());
    var result = await bookingRepo.fetchMyBookings();
    result.fold(
      (failure) =>
          emit(FetchMyBookingsFailure(errorMessage: failure.errorMessage)),
      (myBooking) => emit(FetchMyBookingsSuccess(myBooking: myBooking)),
    );
  }
}
