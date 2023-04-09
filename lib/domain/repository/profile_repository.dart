import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:installateur/domain/model/user_model.dart';

import '../../data/network/failure.dart';

abstract class ProfileRepository {
  Future<UserModel> getUserFromLocal();
  Future<Either<Failure, UserModel>> updateProfile(File? file);
}
