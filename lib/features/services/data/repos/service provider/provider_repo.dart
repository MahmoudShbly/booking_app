import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/features/services/data/models/service%20provider/booking_request_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProviderRepo {

  Future <Either<ServerFailure,List<BookingRequestModel>>> fetchBookingRequest ();
  Future <Either<ServerFailure,List<BookingRequestModel>>> fetchBookingRequestByStatus ({required String status});
}