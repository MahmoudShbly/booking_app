part of 'fetch_single_service_cubit.dart';

@immutable
sealed class FetchSingleServiceState {}

final class FetchSingleServiceInitial extends FetchSingleServiceState {}

final class FetchSingleServiceLoading extends FetchSingleServiceState {}

final class FetchSingleServiceSuccess extends FetchSingleServiceState {
  final ServiceModel serviceModel;

  FetchSingleServiceSuccess({required this.serviceModel});
}

final class FetchSingleServiceFailure extends FetchSingleServiceState {
  final String errorMessage;

  FetchSingleServiceFailure({required this.errorMessage});
}
