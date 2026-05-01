import 'package:booking_app/features/account/data/repos/account_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_points_state.dart';

class RequestPointsCubit extends Cubit<RequestPointsState> {
  final AccountRepoImpl accountRepoImpl;

  RequestPointsCubit(this.accountRepoImpl) : super(RequestPointsInitial());
  
  Future<void> requestPoints({required Map<String, dynamic> data}) async {
    emit(RequestPointsLoading());
    var result = await accountRepoImpl.requestPoints(data: data);
    result.fold(
      (failure) =>
          emit(RequestPointsFailure(errorMessage: failure.errorMessage)),
      (success) =>
          emit(RequestPointsSuccess()),
    );
  }
}
