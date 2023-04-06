import 'package:dartz/dartz.dart';
import 'package:installateur/domain/model/user_model.dart';

import '../../data/network/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(String email, String password);
}
