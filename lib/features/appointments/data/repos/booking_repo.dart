import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/features/appointments/data/models/booking_model.dart';
import 'package:booking_app/features/appointments/data/models/rating_model.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepo {
  Future <Either<ServerFailure,List<BookingModel>>> fetchMyBookings ();
  Future <Either<ServerFailure,String>> cancelBooking (int bookingId);
  Future <Either<ServerFailure,String>> ratnigService ({required RatingModel rating,required BookingModel booking} );
}