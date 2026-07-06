part of 'accept_service_cubit.dart';

@immutable
sealed class AcceptServiceState {}

final class AcceptServiceInitial extends AcceptServiceState {}

final class AcceptServiceLoading extends AcceptServiceState {
  final int serviceId;

  AcceptServiceLoading({required this.serviceId});
}

final class AcceptServiceSuccess extends AcceptServiceState {
  final String message;
  final int serviceId;

  AcceptServiceSuccess({required this.message, required this.serviceId});
}

final class AcceptServiceFailure extends AcceptServiceState {
  final String errorMessage;
  final int serviceId;

  AcceptServiceFailure({required this.errorMessage, required this.serviceId});
}
