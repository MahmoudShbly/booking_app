part of 'cancel_booking_cubit.dart';

@immutable
sealed class CancelBookingState {}

final class CancelBookingInitial extends CancelBookingState {}
final class CancelBookingLoading extends CancelBookingState {}
final class CancelBookingSuccess extends CancelBookingState {
  final String successMessage;
  CancelBookingSuccess({required this.successMessage});
}
final class CancelBookingFailure extends CancelBookingState {
  final String errorMessage;
  CancelBookingFailure({required this.errorMessage});
}
