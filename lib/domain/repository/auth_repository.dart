import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(String email, String password);
}
