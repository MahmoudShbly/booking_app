part of 'book_service_cubit.dart';

@immutable
sealed class BookServiceState {}

final class BookServiceInitial extends BookServiceState {}

final class BookServiceLoading extends BookServiceState {
  final int serviceId;

  BookServiceLoading({required this.serviceId});
}

final class BookServiceSuccess extends BookServiceState {
  final int serviceId;
  final String successMessage;

  BookServiceSuccess({required this.serviceId, required this.successMessage});
}

final class BookServiceFailure extends BookServiceState {
  final int serviceId;
  final String errorMessage;

  BookServiceFailure({required this.serviceId, required this.errorMessage});
}
