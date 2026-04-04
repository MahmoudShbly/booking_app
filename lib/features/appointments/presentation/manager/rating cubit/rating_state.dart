part of 'rating_cubit.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}

final class RatingChangedState extends RatingState {}

final class RatingFailureState extends RatingState {
  final int bookingId;
  final String errorMessage;

  RatingFailureState({required this.bookingId, required this.errorMessage});
}

final class RatingSuccessState extends RatingState {
  final int bookingId;
  final String successMessage;

  RatingSuccessState({required this.bookingId, required this.successMessage});
}

final class RatingLoadingState extends RatingState {
  final int bookingId;
  RatingLoadingState({required this.bookingId});
}
