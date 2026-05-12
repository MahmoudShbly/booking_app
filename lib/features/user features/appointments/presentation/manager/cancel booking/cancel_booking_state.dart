part of 'cancel_booking_cubit.dart';

@immutable
sealed class CancelBookingState {}

final class CancelBookingInitial extends CancelBookingState {}
final class CancelBookingLoading extends CancelBookingState {
  final int bookingId;
  CancelBookingLoading({required this.bookingId});
}
final class CancelBookingSuccess extends CancelBookingState {
  final String successMessage;
  final int bookingId;
  CancelBookingSuccess({required this.successMessage, required this.bookingId});
}
final class CancelBookingFailure extends CancelBookingState {
  final String errorMessage;
  final int bookingId;
  CancelBookingFailure({required this.errorMessage, required this.bookingId});
}
