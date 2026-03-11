part of 'fetch_services_by_category_id_cubit.dart';

@immutable
sealed class FetchServicesByCategoryIdState {}

final class FetchServicesByCategoryIdInitial
    extends FetchServicesByCategoryIdState {}

final class FetchServiceByCategoryIdLoading
    extends FetchServicesByCategoryIdState {}

final class FetchServicesByCategoryIdSuccess
    extends FetchServicesByCategoryIdState {
  final List<ServiceModel> services;
  FetchServicesByCategoryIdSuccess(this.services);
}

final class FetchServicesByCategoryIdFailure
    extends FetchServicesByCategoryIdState {
  final String errorMessage;
  FetchServicesByCategoryIdFailure(this.errorMessage);
}
