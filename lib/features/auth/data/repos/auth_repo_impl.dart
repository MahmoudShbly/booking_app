import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/core/utils/api_end_points.dart';
import 'package:booking_app/core/utils/api_services.dart';
import 'package:booking_app/core/utils/scure_storage_services.dart';
import 'package:booking_app/features/auth/data/models/user_model.dart';
import 'package:booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<ServerFailure, UserModel>> login(
    String email,
    String password,
  ) async {
    try {
      var result = await ApiServices().post(
        endPoint: ApiEndPoints.login,
        data: {'email': email, 'password': password},
      );
      final ScureStorageServices storageServices = ScureStorageServices();
      storageServices.saveAuthData(userToken: result['access_token']);
      return right(UserModel.fromJson(result['user']));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, void>> logout() async {
    try {
      await ApiServices().post(
        endPoint: ApiEndPoints.logout,
      );
      final ScureStorageServices storageServices = ScureStorageServices();
      await storageServices.clearAuthData();
      return right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
