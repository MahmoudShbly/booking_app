import 'package:booking_app/features/admin%20features/providers/data/repos/providers_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'accept_service_state.dart';

class AcceptServiceCubit extends Cubit<AcceptServiceState> {
  final ProvidersRepoImpl providersRepoImpl;

  AcceptServiceCubit(this.providersRepoImpl)
      : super(AcceptServiceInitial());

  Future<void> acceptService({required int serviceId}) async {
    emit(AcceptServiceLoading(serviceId: serviceId));
    final result = await providersRepoImpl.acceptService(serviceId: serviceId);
    result.fold(
      (failure) => emit(
        AcceptServiceFailure(
          errorMessage: failure.errorMessage,
          serviceId: serviceId,
        ),
      ),
      (message) => emit(
        AcceptServiceSuccess(
          message: message,
          serviceId: serviceId,
        ),
      ),
    );
  }
}
