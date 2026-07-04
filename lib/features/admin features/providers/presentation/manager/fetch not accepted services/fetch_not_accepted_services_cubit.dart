import 'package:booking_app/features/admin%20features/providers/data/repos/providers_repo_impl.dart';
import 'package:booking_app/features/user%20features/home/data/models/service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_not_accepted_services_state.dart';

class FetchNotAcceptedServicesCubit extends Cubit<FetchNotAcceptedServicesState> {
  final ProvidersRepoImpl providersRepoImpl;
  ServiceModel? firstService;

  FetchNotAcceptedServicesCubit(this.providersRepoImpl)
      : super(FetchNotAcceptedServicesInitial());

  Future<void> fetchNotAcceptedServices() async {
    emit(FetchNotAcceptedServicesLoading());
    final result = await providersRepoImpl.fetchNotAcceptedServices();
    result.fold(
      (failure) => emit(
        FetchNotAcceptedServicesFailure(errorMessage: failure.errorMessage),
      ),
      (services) {
        firstService = services.isNotEmpty ? services.first : null;
        emit(FetchNotAcceptedServicesSuccess(services: services));
      },
    );
  }
}
