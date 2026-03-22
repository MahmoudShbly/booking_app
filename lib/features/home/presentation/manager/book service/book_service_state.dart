part of 'book_service_cubit.dart';

@immutable
sealed class BookServiceState {}

final class BookServiceInitial extends BookServiceState {}

final class BookServiceLoading extends BookServiceState {}

final class BookServiceSuccess extends BookServiceState {
  final String successMessage;

  BookServiceSuccess({required this.successMessage});
}

final class BookServiceFailure extends BookServiceState {
  final String errorMessage;

  BookServiceFailure({required this.errorMessage});
}
