part of 'fetch_service_info_cubit.dart';

@immutable
sealed class FetchServiceInfoState {}

final class FetchServiceInfoInitial extends FetchServiceInfoState {}
final class FetchServiceInfoBookingFilterChanged extends FetchServiceInfoState {}

