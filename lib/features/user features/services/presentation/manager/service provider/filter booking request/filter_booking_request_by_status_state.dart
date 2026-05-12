part of 'filter_booking_request_by_status_cubit.dart';

@immutable
sealed class FilterBookingRequestByStatusState {}

final class FilterBookingRequestByStatusInitial extends FilterBookingRequestByStatusState {}
final class FilterBookingRequestFilterChanged extends FilterBookingRequestByStatusState {}