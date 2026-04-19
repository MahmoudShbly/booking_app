import 'package:bloc/bloc.dart';
import 'package:booking_app/features/services/data/models/service%20provider/service_info_model.dart';
import 'package:booking_app/features/services/data/repos/service%20provider/provider_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_provider_service_info_cubit_state.dart';

class FetchProviderServiceInfoCubitCubit
    extends Cubit<FetchProviderServiceInfoCubitState> {
  FetchProviderServiceInfoCubitCubit(this.providerRepo)
    : super(FetchProviderServiceInfoCubitInitial());

  final ProviderRepo providerRepo;

  Future<void> fetchProviderServiceInfo() async {
    emit(FetchProviderServiceInfoCubitLoading());

    final result = await providerRepo.fetchProviderServiceInfo();
    result.fold(
      (failure) => emit(
        FetchProviderServiceInfoCubitFailure(message: failure.errorMessage),
      ),
      (serviceInfo) =>
          emit(FetchProviderServiceInfoCubitSuccess(serviceInfo: serviceInfo)),
    );
  }
}
