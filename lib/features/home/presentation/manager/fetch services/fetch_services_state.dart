part of 'fetch_services_cubit.dart';

@immutable
sealed class FetchServicesState {}

final class FetchServicesInitial extends FetchServicesState {}
final class FetchServicesLoading extends FetchServicesState {}
final class FetchServicesSuccess extends FetchServicesState {}
final class FetchServicesFailure extends FetchServicesState {}
