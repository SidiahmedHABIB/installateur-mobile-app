import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:installateur/domain/model/intervention.dart';
import 'package:installateur/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:installateur/domain/model/user_model.dart';
import '../../app/app_constants.dart';
import '../../domain/repository/inter_repository.dart';
import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/network_checker.dart';

class InterventionRepositoryImp extends GetxService
    implements InterventionRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkChecker _networkChercher;

  InterventionRepositoryImp(
      this._remoteDataSource, this._localDataSource, this._networkChercher);
  @override
  Future<Either<Failure, PageIntervention>> getPageIntervention(
      String status, int page, int size) async {
    if (await _networkChercher.isConnected) {
      try {
        Response response = await _remoteDataSource
            .getData("${AppConstants.GET_PAGE_INTER_URI}$status&$page&$size");
        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          PageIntervention pageIntervention =
              PageIntervention.fromJson(response.body);
          return Right(pageIntervention);
        } else {
          return left(
              Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST));
        }
      } on Exception {
        return (left(
            Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST)));
      }
    } else {
      return Left(Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT));
    }
  }

  @override
  Future<Either<Failure, InterventionModel>> getInterventionById(int id) async {
    if (await _networkChercher.isConnected) {
      try {
        Response response = await _remoteDataSource
            .getData("${AppConstants.GET_INTER_BY_ID_URI}$id");
        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          InterventionModel interventionModel =
              InterventionModel.fromJson(response.body);
          return Right(interventionModel);
        } else {
          return left(
              Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST));
        }
      } on Exception {
        return (left(
            Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST)));
      }
    } else {
      return Left(Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT));
    }
  }

  @override
  Future<Either<Failure, InterventionModel>> addAppointement(
      int? uId, int? interId) async {
    if (await _networkChercher.isConnected) {
      try {
        print("in try");
        int s = uId! + uId;
        print("somme uId $s");
        Response response = await _remoteDataSource
            .getData("${AppConstants.GET_INTER_ADD_APPMT_URI}$uId&$interId");
        print("in after remo");

        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          print("in 200");
          InterventionModel interventionModel =
              InterventionModel.fromJson(response.body);
          return Right(interventionModel);
        } else {
          print("in 400");

          return left(
              Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST));
        }
      } on Exception {
        print("in catch");

        return (left(
            Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST)));
      }
    } else {
      return Left(Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT));
    }
  }

  @override
  Future<Either<Failure, PageIntervention>> getPageInterPlannedByUser(
      int? uId, String status, int page, int size) async {
    if (await _networkChercher.isConnected) {
      try {
        print("in try $uId");
        Response response = await _remoteDataSource.getData(
            "${AppConstants.GET_PAGE_INTER_STATUS_BY_USER_URI}$uId&$status&$page&$size");
        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          PageIntervention pageIntervention =
              PageIntervention.fromJson(response.body);
          return Right(pageIntervention);
        } else {
          return left(
              Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST));
        }
      } on Exception {
        return (left(
            Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST)));
      }
    } else {
      return Left(Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT));
    }
  }
}
