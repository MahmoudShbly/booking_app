import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/features/appointments/data/models/booking_model.dart';
import 'package:booking_app/features/home/data/models/rating_model.dart';
import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:dartz/dartz.dart';

abstract class AppointmentsRepo {
  Future <Either<List<BookingModel>,ServerFailure>> fetchMyBookingsByStatus (String status);
  Future <Either<String,ServerFailure>> cancelBooking (BookingModel booking);
  Future <Either<String,ServerFailure>> ratnigService (RatingModel rating, ServiceModel service );
}