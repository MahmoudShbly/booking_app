
import 'package:booking_app/features/services/data/models/service%20provider/booking_request_model.dart';
import 'package:booking_app/features/services/data/repos/service%20provider/provider_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'fetch_service_info_state.dart';

class FetchBookingRequestCubit extends Cubit<FetchBookingRequestState> {
  FetchBookingRequestCubit(this.providerRepo)
    : super(FetchBookingRequestInitial());

  final ProviderRepo providerRepo;

  int selectedFilterIndex = 0;
  final List<String> bookingsStatus = ['الطلبات', 'بانتظار الدفع', 'المؤكدة'];
  final List<BookingRequestModel> bookingRequests = [];

  Future<void> fetchBookingRequests() async {
    emit(FetchBookingRequestLoading());

    final result = await providerRepo.fetchBookingRequest();
    result.fold(
      (failure) =>
          emit(FetchBookingRequestFailure(errorMessage: failure.errorMessage)),
      (requests) {
        bookingRequests
          ..clear()
          ..addAll(requests);
        emit(FetchBookingRequestSuccess(requests: requests));
      },
    );
  }

  void selectFilter(int index) {
    selectedFilterIndex = index;
    emit(FetchBookingRequestFilterChanged());
  }
}
