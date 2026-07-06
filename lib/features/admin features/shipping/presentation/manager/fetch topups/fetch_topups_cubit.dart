import 'package:booking_app/features/admin%20features/shipping/data/models/topup_request_model.dart';
import 'package:booking_app/features/admin%20features/shipping/data/repos/shipping_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_topups_state.dart';

class FetchTopupsCubit extends Cubit<FetchTopupsState> {
  final ShippingRepoImpl shippingRepoImpl;

  FetchTopupsCubit(this.shippingRepoImpl) : super(FetchTopupsInitial());
   List<TopupRequestModel>? firstRequests;

  Future<void> fetchTopups() async {
    emit(FetchTopupsLoading());
    final result = await shippingRepoImpl.fetchTopups();
    result.fold(
      (failure) => emit(FetchTopupsFailure(errorMessage: failure.errorMessage)),
      (requests) {
        if (requests.isNotEmpty) {
          firstRequests = requests.take(2).toList();
        } else {
          firstRequests = [];
        }
        emit(FetchTopupsSuccess(requests: requests));
      },
    );
  }

  Future<void> approveTopup({required int topupId}) async {
    emit(FetchTopupsApproveLoading(topupId: topupId));
    final result = await shippingRepoImpl.approveTopup(topupId: topupId);
    result.fold(
      (failure) => emit(
        FetchTopupsApproveFailure(
          errorMessage: failure.errorMessage,
          topupId: topupId,
        ),
      ),
      (message) async {
        emit(FetchTopupsApproveSuccess(message: message, topupId: topupId));
        await fetchTopups();
      },
    );
  }
}
