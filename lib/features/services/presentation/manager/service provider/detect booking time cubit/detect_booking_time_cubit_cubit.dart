import 'package:booking_app/features/services/data/repos/service%20provider/provider_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detect_booking_time_cubit_state.dart';

class DetectBookingTimeCubitCubit extends Cubit<DetectBookingTimeCubitState> {
  DetectBookingTimeCubitCubit(this.providerRepo) : super(DetectBookingTimeCubitInitial());
  final ProviderRepoImpl providerRepo;

  Future<void> detectBookingTime({
    required int bookingRequestId,
    required String time,
  }) async {
    emit(DetectBookingTimeCubitLoading());
    final result = await providerRepo.detectBookingTime(
      bookingRequestId: bookingRequestId,
      time: time,
    );

    result.fold(
      (failure) => emit(DetectBookingTimeCubitFailure(message: failure.errorMessage)),
      (message) => emit(DetectBookingTimeCubitSuccess(message: message)),
    );
  }
}
