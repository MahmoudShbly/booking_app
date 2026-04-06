import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/core/utils/api_end_points.dart';
import 'package:booking_app/core/utils/api_services.dart';
import 'package:booking_app/core/utils/secure_storage_services.dart';
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
      final SecureStorageServices storageServices = SecureStorageServices();
      final userData = UserModel.fromJson(result['user']);
      storageServices.saveToken(userToken: result['access_token']);
      storageServices.saveUserData(
        name: userData.name,
        email: userData.email,
        phone: userData.phone,
        id: userData.id,
        role: userData.role,
      );
      storageServices.saveToken(userToken: result['access_token']);
      return right(userData);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, UserModel>> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String name,
  }) async {
    try {
      var result = await ApiServices().post(
        endPoint: ApiEndPoints.register,
        data: {
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
          'phone': phone,
          'name': name,
        },
      );
      final SecureStorageServices storageServices = SecureStorageServices();
      final userData = UserModel.fromJson(result['user']);
      storageServices.saveToken(userToken: result['access_token']);
      storageServices.saveUserData(
        name: userData.name,
        email: userData.email,
        phone: userData.phone,
        id: userData.id,
        role: userData.role,
      );
      return right(userData);
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
      await ApiServices().post(endPoint: ApiEndPoints.logout);
      final SecureStorageServices storageServices = SecureStorageServices();
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
