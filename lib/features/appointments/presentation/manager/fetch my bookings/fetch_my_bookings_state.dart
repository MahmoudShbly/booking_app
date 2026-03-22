part of 'fetch_my_bookings_cubit.dart';

@immutable
sealed class FetchMyBookingsState {}

final class FetchMyBookingsInitial extends FetchMyBookingsState {}
final class FetchMyBookingsLoading extends FetchMyBookingsState {}
final class FetchMyBookingsFailure extends FetchMyBookingsState {
  final String errorMessage;

  FetchMyBookingsFailure({required this.errorMessage});
  
}
final class FetchMyBookingsSuccess extends FetchMyBookingsState {
  final List<BookingModel> myBooking ;

  FetchMyBookingsSuccess({required this.myBooking});
}
