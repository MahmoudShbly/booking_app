import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/core/utils/api_end_points.dart';
import 'package:booking_app/core/utils/api_services.dart';
import 'package:booking_app/features/admin%20features/shipping/data/models/topup_request_model.dart';
import 'package:booking_app/features/admin%20features/shipping/data/repos/shipping_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ShippingRepoImpl implements ShippingRepo {
  @override
  Future<Either<Failure, List<TopupRequestModel>>> fetchTopups() async {
    try {
      final result = await ApiServices().get(endPoint: ApiEndPoints.requestPoints);

      final List<TopupRequestModel> requests = [];
      for (final item in result['data']) {
        if(item['status'] == 'pending') {
          requests.add(TopupRequestModel.fromJson(item));
        }
      }

      return right(requests);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> approveTopup({required int topupId}) async {
    try {
      final result = await ApiServices().put(
        endPoint: '${ApiEndPoints.requestPoints}/$topupId/approve',
      );
      return right(result['message'] ?? 'تمت الموافقة على الطلب بنجاح');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
