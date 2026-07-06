import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/features/user%20features/home/data/models/service_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProvidersRepo {
  Future<Either<Failure, List<ServiceModel>>> fetchNotAcceptedServices();
  Future<Either<Failure, String>> acceptService({required int serviceId});
}
