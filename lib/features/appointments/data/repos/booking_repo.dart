import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/features/appointments/data/models/booking_model.dart';
import 'package:booking_app/features/home/data/models/rating_model.dart';
import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepo {
  Future <Either<ServerFailure,List<BookingModel>>> fetchMyBookings ();
  Future <Either<ServerFailure,String>> cancelBooking (BookingModel booking);
  Future <Either<ServerFailure,String>> ratnigService (RatingModel rating, ServiceModel service );
}