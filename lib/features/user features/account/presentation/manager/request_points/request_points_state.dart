part of 'request_points_cubit.dart';

@immutable
sealed class RequestPointsState {}

final class RequestPointsInitial extends RequestPointsState {}

final class RequestPointsLoading extends RequestPointsState {}

final class RequestPointsSuccess extends RequestPointsState {}

final class RequestPointsFailure extends RequestPointsState {
  final String errorMessage;
  RequestPointsFailure({required this.errorMessage});
}
