import 'dart:convert';

import 'package:get/get.dart';
import 'package:installateur/domain/model/intervention.dart';
import 'package:installateur/data/network/failure.dart';
import 'package:dartz/dartz.dart';
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
  final NetworkChercher _networkChercher;

  InterventionRepositoryImp(
      this._remoteDataSource, this._localDataSource, this._networkChercher);
  @override
  Future<Either<Failure, PageIntervention>> getPageIntervention(
      String status, int page, int size) async {
    if (await _networkChercher.isConnected) {
      try {
        Response response = await _remoteDataSource
            .getData(AppConstants.GET_PAGE_INTER_URI + "$status&$page&$size");
        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          PageIntervention pageIntervention =
              PageIntervention.fromJson(response.body);
          print(pageIntervention.totalPages);
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
