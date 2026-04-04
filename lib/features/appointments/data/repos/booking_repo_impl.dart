import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/core/utils/api_end_points.dart';
import 'package:booking_app/core/utils/api_services.dart';
import 'package:booking_app/features/appointments/data/models/booking_model.dart';
import 'package:booking_app/features/appointments/data/models/rating_model.dart';
import 'package:booking_app/features/appointments/data/repos/booking_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BookingRepoImpl extends BookingRepo {
  @override
  Future<Either<ServerFailure, List<BookingModel>>> fetchMyBookings() async {
    try {
      List<BookingModel> myBooking = [];
      List<dynamic> result = await ApiServices().get(
        endPoint: ApiEndPoints.myBooking,
       
      );
      for (var booking in result) {
        myBooking.add(BookingModel.fromJson(booking));
      }

      return right(myBooking);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<ServerFailure, String>> cancelBooking(
    BookingModel booking,
  ) async {
    try {
      var result = await ApiServices().post(
        endPoint:
            '${ApiEndPoints.booking}/${booking.id}/${ApiEndPoints.cancel}',
        
      );
      return right(result['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<ServerFailure, String>> ratnigService(
    {required RatingModel rating,
    required BookingModel booking}
  ) async {
    try {
      var result = await ApiServices().post(
        endPoint: '${ApiEndPoints.services}/${booking.serviceId}/${ApiEndPoints.rating}',
        data: rating.toJson(),
      );
      return right(result['message'] ?? 'تم التقييم بنجاح');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
