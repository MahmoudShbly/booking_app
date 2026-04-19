import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/features/services/data/models/service%20provider/booking_request_model.dart';
import 'package:booking_app/features/services/data/models/service%20provider/service_info_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProviderRepo {

  Future <Either<ServerFailure,List<BookingRequestModel>>> fetchBookingRequest ({ String status});
  Future <Either<ServerFailure,String>> detectBookingTime ({ required int bookingRequestId , required String time});
  Future <Either<ServerFailure,ServiceInfoModel>> fetchProviderServiceInfo ();
}