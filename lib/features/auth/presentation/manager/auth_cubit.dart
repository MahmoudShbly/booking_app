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
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> login() async {
    emit(AuthLoading());
    var result = await authRepo.login(
      emailController.text,
      passwordController.text,
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.errorMessage)),
      (user) {
        emit(AuthLogginIn(user: user));
        clearControllers();
      },
    );
  }

  Future<void> register() async {
    emit(AuthLoading());
    var result = await authRepo.register(
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      phone: phoneController.text,
      name: nameController.text,
    );
    result.fold(
      (failure) {
        emit(AuthFailure(failure.errorMessage));
        
      },
      (user) {
        emit(AuthRegistered(user: user));
        clearControllers();
      },
    );
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    phoneController.clear();
    confirmPasswordController.clear();}
}