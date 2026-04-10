import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/core/utils/api_end_points.dart';
import 'package:booking_app/core/utils/api_services.dart';
import 'package:booking_app/core/utils/secure_storage_services.dart';
import 'package:booking_app/features/account/data/repos/account_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AccountRepoImpl extends AccountRepo {
	@override
	Future<Either<ServerFailure, void>> logout() async {
		try {
			await ApiServices().post(endPoint: ApiEndPoints.logout);
			await SecureStorageServices().clearAuthData();
			return right(null);
		} on Exception catch (e) {
			if (e is DioException) {
				return left(ServerFailure.fromDioError(e));
			}
			return left(ServerFailure(e.toString()));
		}
	}
}
