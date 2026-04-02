part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthLogginIn extends AuthState {
  final UserModel user;
  AuthLogginIn ({required this.user,});
}
final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);
}
final class AuthLoggedOut extends AuthState {}

final class AuthRegistered extends AuthState {
  final UserModel user;
  AuthRegistered({required this.user});
}