import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<ServerFailure, UserModel>> login(String email, String password);
  Future<Either<ServerFailure, UserModel>> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String name,
  });
  Future<Either<ServerFailure, void>> logout();
}
