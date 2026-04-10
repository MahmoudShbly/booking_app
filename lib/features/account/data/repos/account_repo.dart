import 'package:booking_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AccountRepo {
	Future<Either<ServerFailure, void>> logout();
}
