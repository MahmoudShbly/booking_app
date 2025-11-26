import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:booking_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_single_service_state.dart';

class FetchSingleServiceCubit extends Cubit<FetchSingleServiceState> {
  final HomeRepoImpl homeRepoImpl;
  FetchSingleServiceCubit(this.homeRepoImpl)
    : super(FetchSingleServiceInitial());

  Future<dynamic> fetchSingleService(int id) async {
    var result = await homeRepoImpl.fetchServicesById(id);
    result.fold(
      (failure) => emit(FetchSingleServiceFailure(errorMessage:  failure.errorMessage)),
      (service) {
        emit(FetchSingleServiceSuccess(serviceModel: service));
       
      },
    );
  }
}
