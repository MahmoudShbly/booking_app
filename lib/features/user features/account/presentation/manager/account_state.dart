part of 'account_cubit.dart';

@immutable
sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class AccountLoading extends AccountState {}

final class AccountLoaded extends AccountState {
  final UserModel userData;

  AccountLoaded(this.userData);
}

final class AccountError extends AccountState {
  final String message;

  AccountError(this.message);
}
