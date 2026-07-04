import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/core/utils/api_end_points.dart';
import 'package:booking_app/core/utils/api_services.dart';
import 'package:booking_app/features/admin%20features/providers/data/repos/providers_repo.dart';
import 'package:booking_app/features/user%20features/home/data/models/service_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProvidersRepoImpl implements ProvidersRepo {
  @override
  Future<Either<Failure, List<ServiceModel>>> fetchNotAcceptedServices() async {
    try {
      final result = await ApiServices().get(
        endPoint: ApiEndPoints.notAcceptedServices,
      );

      final List<ServiceModel> services = [];
        for (final item in result['data']) {
          services.add(ServiceModel.fromJson(item));
        }
     
      return right(services);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
