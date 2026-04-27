import 'package:booking_app/features/services/presentation/manager/service%20provider/fetch%20bookings%20request/fetch_booking_request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_booking_request_by_status_state.dart';

class FilterBookingRequestByStatusCubit extends Cubit<FilterBookingRequestByStatusState> {
  FilterBookingRequestByStatusCubit() : super(FilterBookingRequestByStatusInitial());

      int selectedFilterIndex = 0;

  final List<String> bookingsStatus = ['الطلبات', 'بانتظار الدفع', 'المؤكدة'];
  final List<String> eBookingsStatus = ['pending','scheduled','confirmed'];

    void selectFilter(int index , BuildContext context) {
    selectedFilterIndex = index;
    emit(FilterBookingRequestFilterChanged());
    context.read<FetchBookingRequestCubit>().fetchBookingRequests(status: eBookingsStatus[index]);
  }
}
