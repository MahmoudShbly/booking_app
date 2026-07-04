import 'package:booking_app/features/admin%20features/home/data/repos/admin_home_repo_impl.dart';
import 'package:booking_app/features/user%20features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_users_state.dart';

class FetchUsersCubit extends Cubit<FetchUsersState> {
  final AdminHomeRepoImpl adminHomeRepoImpl;
  int? usersCount;

  FetchUsersCubit(this.adminHomeRepoImpl) : super(FetchUsersInitial());

  Future<void> fetchUsers() async {
    emit(FetchUsersLoading());
    final result = await adminHomeRepoImpl.fetchUsers();
    result.fold(
      (failure) => emit(FetchUsersFailure(errorMessage: failure.errorMessage)),
      (users) {
        usersCount = users.length;
        emit(FetchUsersSuccess(users: users));
      },
    );
  }
}
