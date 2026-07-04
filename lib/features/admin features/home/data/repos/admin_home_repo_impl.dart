import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/core/utils/api_end_points.dart';
import 'package:booking_app/core/utils/api_services.dart';
import 'package:booking_app/features/admin%20features/home/data/repos/admin_home_repo.dart';
import 'package:booking_app/features/user%20features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AdminHomeRepoImpl implements AdminHomeRepo {
  @override
  Future<Either<Failure, List<UserModel>>> fetchUsers() async {
    try {
      final result = await ApiServices().get(endPoint: ApiEndPoints.allUsers);

      final List<UserModel> users = [];
      for (final item in result['data']) {
        users.add(UserModel.fromJson(item));
      }

      return right(users);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
