import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/core/utils/api_end_points.dart';
import 'package:booking_app/core/utils/api_services.dart';
import 'package:booking_app/features/services/data/models/service%20provider/booking_request_model.dart';
import 'package:booking_app/features/services/data/repos/service%20provider/provider_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProviderRepoImpl implements ProviderRepo {
	@override
	Future<Either<ServerFailure, List<BookingRequestModel>>>
	fetchBookingRequest() async {
		try {
			final result = await ApiServices().get(endPoint: ApiEndPoints.providerBookings);

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
  Future<Either<ServerFailure, List<BookingRequestModel>>> fetchBookingRequestByStatus({required String status}) {
    // TODO: implement fetchBookingRequestByStatus
    throw UnimplementedError();
  }

}