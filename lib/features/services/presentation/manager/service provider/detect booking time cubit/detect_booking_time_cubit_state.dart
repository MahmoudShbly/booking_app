part of 'detect_booking_time_cubit_cubit.dart';

@immutable
sealed class DetectBookingTimeCubitState {}

final class DetectBookingTimeCubitInitial extends DetectBookingTimeCubitState {}
final class DetectBookingTimeCubitLoading extends DetectBookingTimeCubitState {}
final class DetectBookingTimeCubitSuccess extends DetectBookingTimeCubitState {
  final String message;
  DetectBookingTimeCubitSuccess({required this.message});
}
final class DetectBookingTimeCubitFailure extends DetectBookingTimeCubitState {
  final String message;
  DetectBookingTimeCubitFailure({required this.message});
}