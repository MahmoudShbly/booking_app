part of 'fetch_service_reviews_cubit.dart';

@immutable
sealed class FetchServiceReviewsState {}

final class FetchServiceReviewsInitial extends FetchServiceReviewsState {}
final class FetchServiceReviewsLoading extends FetchServiceReviewsState {}
final class FetchServiceReviewsSuccess extends FetchServiceReviewsState {
  final ReviewModel reviews;
  FetchServiceReviewsSuccess({required this.reviews});
}
final class FetchServiceReviewsFailure extends FetchServiceReviewsState {
  final String message;
  FetchServiceReviewsFailure({required this.message});
}
