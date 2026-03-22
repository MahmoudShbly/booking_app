
import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:booking_app/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_services_by_category_id_state.dart';

class FetchServicesByCategoryIdCubit extends Cubit<FetchServicesByCategoryIdState> {
  FetchServicesByCategoryIdCubit() : super(FetchServicesByCategoryIdInitial());

  final HomeRepoImpl homeRepo = HomeRepoImpl();

  Future<void> fetchServicesByCategoryId(int id) async {
    emit(FetchServiceByCategoryIdLoading());
    var result = await homeRepo.fetchServicesByCategoryId(id);
    result.fold((failure) {
      emit(FetchServicesByCategoryIdFailure(failure.errorMessage));
    }, (services) {
      emit(FetchServicesByCategoryIdSuccess(services));
    });
  }
}
