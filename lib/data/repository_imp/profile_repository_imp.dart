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

class ProfileRepositoryImp extends GetxService implements ProfileRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkChecker _networkChercher;
  ProfileRepositoryImp(
      this._remoteDataSource, this._localDataSource, this._networkChercher);

  @override
  Future<UserModel> getUserFromLocal() async {
    String? userS = _localDataSource.getString(AppConstants.USER_TOKEN);

    UserModel userlocal = UserModel.fromJson(jsonDecode(userS!));
    return userlocal;
  }

  @override
  Future<Either<Failure, UserModel>> updateProfile(
      File? file, int? userId) async {
    if (await _networkChercher.isConnected) {
      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse(AppConstants.POST_EDIT_PROFILE_URI));
        request.fields['id'] = userId.toString();
        request.files
            .add(await http.MultipartFile.fromPath('image', file!.path));
        request.headers.addAll({"Content-type": "multipart/form-data"});
        var responsePost = await request.send();
        if (responsePost.statusCode == ResponseCode.SUCCESS ||
            responsePost.statusCode == ResponseCode.NO_CONTENT) {
          Response response = await _remoteDataSource
              .getData(AppConstants.GET_USER_BY_ID_URI + userId.toString());
          if (response.statusCode == ResponseCode.SUCCESS ||
              response.statusCode == ResponseCode.NO_CONTENT) {
            UserModel userModel = UserModel.fromJson(response.body);
            saveUserLocal(userModel);
            return Right(userModel);
          } else {
            return left(Failure(ResponseCode.BAD_REQUEST, "400 user"));
          }
        } else {
          return left(Failure(ResponseCode.BAD_REQUEST, "400 upload"));
        }
      } on Exception {
        return (left(Failure(ResponseCode.BAD_REQUEST, "in catch")));
      }
    } else {
      return Left(Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT));
    }
  }

  Future<void> saveUserLocal(UserModel userModel) async {
    _localDataSource.setString(AppConstants.USER_TOKEN, jsonEncode(userModel));
  }
}
