import 'package:booking_app/core/errors/failure.dart';
import 'package:booking_app/features/user%20features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AdminHomeRepo {
  Future<Either<Failure, List<UserModel>>> fetchUsers();
}
