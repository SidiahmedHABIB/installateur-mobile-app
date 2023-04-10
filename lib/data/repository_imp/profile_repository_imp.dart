import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:installateur/data/network/error_handler.dart';
import 'package:installateur/domain/model/user_model.dart';
import 'package:installateur/data/network/failure.dart';
import 'package:installateur/domain/repository/profile_repository.dart';
import '../../app/app_constants.dart';
import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';
import '../network/network_checker.dart';
import '../request/profile_request.dart';

class ProfileRepositoryImp extends GetxService implements ProfileRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkChercher _networkChercher;
  ProfileRepositoryImp(
      this._remoteDataSource, this._localDataSource, this._networkChercher);

  @override
  Future<UserModel> getUserFromLocal() async {
    String? userS = _localDataSource.getString(AppConstants.USER_TOKEN);

    UserModel userlocal = UserModel.fromJson(jsonDecode(userS!));
    return userlocal;
  }

  @override
  Future<Either<Failure, UserModel>> updateProfile(File? file) async {
    UserModel user = await getUserFromLocal();
    ProfileRequest profileRequest = ProfileRequest(user: user, file: file);
    if (await _networkChercher.isConnected) {
      try {
        print("try");

        http.Response response = await _remoteDataSource
            .postData(AppConstants.POST_EDIT_PROFILE_URI, {});
        print("after remote");
        print(response.statusCode);
        print(response.body);

        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          print("in 200");

          Map responsebody = jsonDecode(response.body);
          UserModel userModel = UserModel.fromJson(responsebody["profile"]);
          saveUserLocal(userModel);
          return Right(userModel);
        } else {
          print("in 400");
          print(response.body);
          return left(
              Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST));
        }
      } on Exception {
        print("in 405");

        return (left(
            Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST)));
      }
    } else {
      return Left(Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT));
    }
  }

  Future<void> saveUserLocal(UserModel userModel) async {
    _localDataSource.setString(AppConstants.USER_TOKEN, jsonEncode(userModel));
  }
}
