part of 'fetch_topups_cubit.dart';

@immutable
sealed class FetchTopupsState {}

final class FetchTopupsInitial extends FetchTopupsState {}

final class FetchTopupsLoading extends FetchTopupsState {}

final class FetchTopupsSuccess extends FetchTopupsState {
  final List<TopupRequestModel> requests;

  FetchTopupsSuccess({required this.requests});
}

final class FetchTopupsApproveLoading extends FetchTopupsState {
  final int topupId;

  FetchTopupsApproveLoading({required this.topupId});
}

final class FetchTopupsApproveSuccess extends FetchTopupsState {
  final String message;
  final int topupId;

  FetchTopupsApproveSuccess({required this.message, required this.topupId});
}

final class FetchTopupsApproveFailure extends FetchTopupsState {
  final String errorMessage;
  final int topupId;

  FetchTopupsApproveFailure({required this.errorMessage, required this.topupId});
}

final class FetchTopupsFailure extends FetchTopupsState {
  final String errorMessage;

  FetchTopupsFailure({required this.errorMessage});
}
