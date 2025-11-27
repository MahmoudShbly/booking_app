part of 'fetch_services_cubit.dart';

@immutable
sealed class FetchServicesState {}

final class FetchServicesInitial extends FetchServicesState {}
final class FetchServicesLoading extends FetchServicesState {}
final class FetchServicesSuccess extends FetchServicesState {
  final List<ServiceModel> services;
  FetchServicesSuccess({required this.services});
}
final class FetchServicesFailure extends FetchServicesState {
  final String errorMessage;
  FetchServicesFailure({required this.errorMessage});
}
