import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/core/utils/api_end_points.dart';
import 'package:booking_app/core/utils/api_services.dart';
import 'package:booking_app/features/appointments/data/models/review_model.dart';
import 'package:booking_app/features/services/data/models/service%20provider/booking_request_model.dart';
import 'package:booking_app/features/services/data/models/service%20provider/service_info_model.dart';
import 'package:booking_app/features/services/data/repos/service%20provider/provider_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProviderRepoImpl implements ProviderRepo {
  @override
  Future<Either<ServerFailure, List<BookingRequestModel>>> fetchBookingRequest({
    String? status,
  }) async {
    try {
      final result = await ApiServices().get(
        endPoint: ApiEndPoints.providerBookings,
      );

      final List<BookingRequestModel> bookingRequests = [];
      for (final item in result) {
        bookingRequests.add(BookingRequestModel.fromJson(item));
      }

      return right(bookingRequests);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> detectBookingTime({
    required int bookingRequestId,
    required String time,
  }) async {
    try {
      final result = await ApiServices().post(
        endPoint:
            '${ApiEndPoints.booking}/$bookingRequestId/${ApiEndPoints.detectBookingTime}',
        data: {'scheduled_at': time},
      );
      return right(result['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, ServiceInfoModel>>
  fetchProviderServiceInfo() async {
    try {
      final result = await ApiServices().get(
        endPoint: ApiEndPoints.providerService,
      );
      final List<ServiceInfoModel> servicesInfo = [];
      for (final item in result['data']) {
        servicesInfo.add(ServiceInfoModel.fromJson(item));
      }
      return right(servicesInfo[0]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> completeBooking({
    required int bookingRequestId,
  }) async {
    try {
      final result = await ApiServices().post(
        endPoint:
            '${ApiEndPoints.booking}/$bookingRequestId/${ApiEndPoints.completeBooking}',
      );
      return right(result['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<ReviewModel>>> fetchProviderServiceReview({
    required int serviceId,
  }) async {
    try {
      final result = await ApiServices().get(
        endPoint: '${ApiEndPoints.services}/$serviceId/${ApiEndPoints.ratingStats}',
      );

      if (result is List) {
        final List<ReviewModel> reviews = [];
        for (final item in result) {
          reviews.add(ReviewModel.fromJson(item as Map<String, dynamic>));
        }
        return right(reviews);
      }

      return right([ReviewModel.fromJson(result as Map<String, dynamic>)]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
