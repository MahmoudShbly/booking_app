

import 'package:booking_app/core/utils/secure_storage_services.dart';
import 'package:booking_app/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial()) ;
  
  
  final storage = SecureStorageServices();
   UserModel? userData;
  Future <void> fetchUserData()async {
    emit(AccountLoading());
    try {
      userData = await storage.getUserData();
      if (userData != null) {
        emit(AccountLoaded(userData!));
      } else {
        emit(AccountError('No user data found'));
      }
    } catch (e) {
      emit(AccountError('Failed to load user data: $e'));
    }
  }

  void logout()async {
    userData = null;
   await storage.clearAuthData();
    emit(AccountInitial());
  }


}
