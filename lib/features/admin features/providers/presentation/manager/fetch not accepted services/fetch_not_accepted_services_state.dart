part of 'fetch_not_accepted_services_cubit.dart';

@immutable
sealed class FetchNotAcceptedServicesState {}

final class FetchNotAcceptedServicesInitial
    extends FetchNotAcceptedServicesState {}

final class FetchNotAcceptedServicesLoading
    extends FetchNotAcceptedServicesState {}

final class FetchNotAcceptedServicesSuccess
    extends FetchNotAcceptedServicesState {
  final List<ServiceModel> services;

  FetchNotAcceptedServicesSuccess({required this.services});
}

final class FetchNotAcceptedServicesFailure
    extends FetchNotAcceptedServicesState {
  final String errorMessage;

  FetchNotAcceptedServicesFailure({required this.errorMessage});
}
