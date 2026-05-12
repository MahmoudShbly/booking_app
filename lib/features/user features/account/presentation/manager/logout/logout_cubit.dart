import 'package:booking_app/features/user%20features/account/data/repos/account_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.accountRepo) : super(LogoutInitial());

  final AccountRepo accountRepo;

  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await accountRepo.logout();
    result.fold(
      (failure) => emit(LogoutFailure(failure.errorMessage)),
      (_) => emit(LogoutSuccess()),
    );
  }
}
