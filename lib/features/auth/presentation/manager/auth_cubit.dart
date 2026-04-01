import 'package:booking_app/core/utils/scure_storage_services.dart';
import 'package:booking_app/features/auth/data/models/user_model.dart';
import 'package:booking_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  AuthRepoImpl authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    emit(AuthLoading());
    var result = await authRepo.login(
      emailController.text,
      passwordController.text,
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.errorMessage)),
      (user) => emit(AuthLogginIn(user: user)),
    );
  }


  Future<void> logout() async {
    emit(AuthLoading());
    final storage = ScureStorageServices();

    var result = await authRepo.logout();
    result.fold((failure) {
      emit(AuthFailure(failure.errorMessage));
      print(failure.errorMessage);
    },
     (_) async {
      emit(AuthLoggedOut());
      await storage.clearAuthData();
    });
  }
}
