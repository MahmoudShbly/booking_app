import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:dartz/dartz.dart';
abstract class HomeRepo {
  Future<Either<Failure,List <ServiceModel>>> fetchServices();
}
