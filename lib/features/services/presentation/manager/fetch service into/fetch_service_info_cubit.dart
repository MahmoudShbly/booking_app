
import 'package:booking_app/features/services/data/models/service%20provider/booking_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'fetch_service_info_state.dart';

class FetchServiceInfoCubit extends Cubit<FetchServiceInfoState> {
  FetchServiceInfoCubit() : super(FetchServiceInfoInitial());

   int selectedFilterIndex = 0;
  final List<String> bookingsStatus = ['الطلبات', 'بانتظار الدفع', 'المؤكدة'];
  final List<BookingRequestModel> bookingRequests = [
    BookingRequestModel(
      customerName: 'أحمد محمد',
      phoneNumber: '0123456789',
    ),
    BookingRequestModel(
      customerName: 'سارة علي',
      phoneNumber: '0987654321',
    ),
    BookingRequestModel(
      customerName: 'محمد أحمد',
      phoneNumber: '0112233445',
    ),
  ];
  void selectFilter(int index) {
    selectedFilterIndex = index;
    emit(FetchServiceInfoBookingFilterChanged());
  }
}
