part of 'complete_booking_cubit.dart';

@immutable
sealed class CompleteBookingState {}

final class CompleteBookingInitial extends CompleteBookingState {}

final class CompleteBookingLoading extends CompleteBookingState {
	CompleteBookingLoading({required this.bookingRequestId});

	final int bookingRequestId;
}

final class CompleteBookingSuccess extends CompleteBookingState {
	CompleteBookingSuccess({required this.message});

	final String message;
}

final class CompleteBookingFailure extends CompleteBookingState {
	CompleteBookingFailure({required this.message});

	final String message;
}
