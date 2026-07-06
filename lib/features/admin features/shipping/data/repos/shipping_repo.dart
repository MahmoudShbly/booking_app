import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/features/admin%20features/shipping/data/models/topup_request_model.dart';
import 'package:dartz/dartz.dart';

abstract class ShippingRepo {
  Future<Either<Failure, List<TopupRequestModel>>> fetchTopups();
  Future<Either<Failure, String>> approveTopup({required int topupId});
}
