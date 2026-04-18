import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/core/utils/api_end_points.dart';
import 'package:booking_app/core/utils/api_services.dart';
import 'package:booking_app/features/services/data/repos/customer/customer_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CustomerRepoImpl implements CustomerRepo {
  @override
  Future<Either<Failure, String>> addServices(
    dynamic services,
  ) async {
    try {
      var result = await ApiServices().post(
        endPoint: ApiEndPoints.services,
        data: services,
      );
      return right(result["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
