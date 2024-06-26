import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/data/data_source/local_data_source.dart';
import 'package:installateur/data/data_source/remote_data_source.dart';
import 'package:installateur/data/network/error_handler.dart';
import 'package:installateur/data/network/network_checker.dart';
import 'package:installateur/domain/model/login_model.dart';
import 'package:installateur/domain/model/user_model.dart';
import 'package:installateur/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImp extends GetxService implements AuthRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkChecker _networkChercher;

  AuthRepositoryImp(
      this._remoteDataSource, this._localDataSource, this._networkChercher);
  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    if (await _networkChercher.isConnected) {
      try {
        http.Response response = await _remoteDataSource.postLogin(
            AppConstants.POST_LOGIN_URI, email, password);
        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          //Map responsebody = jsonDecode(response.body);
          LoginResponse loginResponse =
              LoginResponse.fromJson(jsonDecode(response.body));
          print(loginResponse.toJson());
          // if (loginResponse.status == "true") {
          saveUserLocal(loginResponse);
          //   return Right(true);
          // } else {

          // }
          return right(true);
        } else {
          print(response.body);
          return left(
              Failure(ResponseCode.SUCCESS, "User Not Found Check Your Email"));
        }
      } on Exception {
        return (left(Failure(ResponseCode.BAD_REQUEST, "catch")));
      }
    } else {
      return Left(Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT));
    }
  }

  Future<void> saveUserLocal(LoginResponse? loginResponse) async {
    _localDataSource.setInt(
        AppConstants.USER_ID_TOKEN, loginResponse!.data!.id);
    _localDataSource.setString(AppConstants.ACCESS_TOKEN,
        loginResponse.tokens!.accessToken.toString());
    _localDataSource.setString(AppConstants.REFRESH_TOKEN,
        loginResponse.tokens!.refreshToken.toString());
    _localDataSource.setString(
        AppConstants.USER_TOKEN, jsonEncode(loginResponse.data));
  }

  Future<UserModel> getUserFromLocal() async {
    String? userS = _localDataSource.getString(AppConstants.USER_TOKEN);
    UserModel userlocal = UserModel.fromJson(jsonDecode(userS!));
    return userlocal;
  }
}
