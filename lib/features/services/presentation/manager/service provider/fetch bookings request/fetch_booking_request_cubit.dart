
import 'package:booking_app/features/services/data/models/service%20provider/booking_request_model.dart';
import 'package:booking_app/features/services/data/repos/service%20provider/provider_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'fetch_booking_request_state.dart';

class FetchBookingRequestCubit extends Cubit<FetchBookingRequestState> {
  FetchBookingRequestCubit(this.providerRepo)
    : super(FetchBookingRequestInitial());

  final ProviderRepo providerRepo;


  final List<BookingRequestModel> bookingRequests = [];

  Future<void> fetchBookingRequests({required String status}) async {
    emit(FetchBookingRequestLoading());

    final result = await providerRepo.fetchBookingRequest(status: status);
    result.fold(
      (failure) =>
          emit(FetchBookingRequestFailure(errorMessage: failure.errorMessage)),
      (requests) {
        final filteredRequests =
            requests.where((i) => i.status == status).toList();

        bookingRequests
          ..clear()
          ..addAll(filteredRequests);
        emit(FetchBookingRequestSuccess(requests: filteredRequests));
      },
    );
  }


}
