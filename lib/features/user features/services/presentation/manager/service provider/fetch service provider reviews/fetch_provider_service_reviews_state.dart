part of 'fetch_provider_service_reviews_cubit.dart';

@immutable
sealed class FetchProviderServiceReviewsState {}

final class FetchProviderServiceReviewsInitial extends FetchProviderServiceReviewsState {}

final class FetchProviderServiceReviewsLoading
		extends FetchProviderServiceReviewsState {}

final class FetchProviderServiceReviewsSuccess
		extends FetchProviderServiceReviewsState {
	FetchProviderServiceReviewsSuccess({required this.reviews});

	final List<ReviewModel> reviews;
}

final class FetchProviderServiceReviewsFailure
		extends FetchProviderServiceReviewsState {
	FetchProviderServiceReviewsFailure({required this.message});

	final String message;
}
