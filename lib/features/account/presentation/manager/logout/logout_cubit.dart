import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app/features/account/data/repos/account_repo.dart';

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
