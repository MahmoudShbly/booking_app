import 'package:booking_app/features/services/data/repos/service%20provider/provider_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'complete_booking_state.dart';

class CompleteBookingCubit extends Cubit<CompleteBookingState> {
  CompleteBookingCubit(this.providerRepo) : super(CompleteBookingInitial());

  final ProviderRepo providerRepo;

  Future<void> completeBooking({required int bookingRequestId}) async {
    emit(CompleteBookingLoading(bookingRequestId: bookingRequestId));

    final result = await providerRepo.completeBooking(
      bookingRequestId: bookingRequestId,
    );

    result.fold(
      (failure) => emit(CompleteBookingFailure(message: failure.errorMessage)),
      (message) => emit(CompleteBookingSuccess(message: message)),
    );
  }


}
