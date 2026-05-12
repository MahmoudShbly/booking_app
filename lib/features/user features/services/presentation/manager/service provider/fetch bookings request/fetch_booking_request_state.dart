part of 'fetch_booking_request_cubit.dart';

@immutable
sealed class FetchBookingRequestState {}

final class FetchBookingRequestInitial extends FetchBookingRequestState {}
final class FetchBookingRequestLoading extends FetchBookingRequestState {}
final class FetchBookingRequestFilterChanged extends FetchBookingRequestState {}
final class FetchBookingRequestSuccess extends FetchBookingRequestState {
	FetchBookingRequestSuccess({required this.requests});

	final List<BookingRequestModel> requests;
}

final class FetchBookingRequestFailure extends FetchBookingRequestState {
	FetchBookingRequestFailure({required this.errorMessage});

	final String errorMessage;
}

