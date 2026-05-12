part of 'fetch_provider_service_info_cubit_cubit.dart';

@immutable
sealed class FetchProviderServiceInfoCubitState {}

final class FetchProviderServiceInfoCubitInitial extends FetchProviderServiceInfoCubitState {}
final class FetchProviderServiceInfoCubitLoading
		extends FetchProviderServiceInfoCubitState {}

final class FetchProviderServiceInfoCubitSuccess extends FetchProviderServiceInfoCubitState {
	FetchProviderServiceInfoCubitSuccess({required this.serviceInfo});

	final ServiceInfoModel serviceInfo;
}

final class FetchProviderServiceInfoCubitFailure extends FetchProviderServiceInfoCubitState {
	FetchProviderServiceInfoCubitFailure({required this.message});

	final String message;
}
