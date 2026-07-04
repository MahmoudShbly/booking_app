import 'package:booking_app/features/user%20features/home/data/models/service_model.dart';
import 'package:booking_app/features/user%20features/home/data/repos/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_services_state.dart';

class FetchServicesCubit extends Cubit<FetchServicesState> {
  final HomeRepoImpl homeRepoImpl;
  int? providerCounts;

  FetchServicesCubit(this.homeRepoImpl) : super(FetchServicesInitial());

  Future<void> fetchServices() async {
    emit(FetchServicesLoading());
    final result = await homeRepoImpl.fetchServices();
    result.fold(
      (failure) => emit(FetchServicesFailure(errorMessage: failure.errorMessage)),
      (services) {
        providerCounts = services.length;
        emit(FetchServicesSuccess(services: services));
      },
    );
  }
}
