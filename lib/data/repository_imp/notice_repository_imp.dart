import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:installateur/data/network/failure.dart';

import '../../app/app_constants.dart';
import '../../domain/model/notice_model.dart';
import '../../domain/repository/notice_repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/network_checker.dart';

class NoticeRepositoryImp extends GetxService implements NoticeRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkChercher _networkChercher;

  NoticeRepositoryImp(this._remoteDataSource, this._networkChercher);
  @override
  Future<Either<Failure, PageNotice>> getPageNotice(int page, int size) async {
    if (await _networkChercher.isConnected) {
      try {
        Response response = await _remoteDataSource
            .getData("${AppConstants.GET_PAGE_NOTICE_ALL_URI}$page&$size");
        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          PageNotice pageNotice = PageNotice.fromJson(response.body);
          return Right(pageNotice);
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
  Future<Either<Failure, Uint8List>> getDownloadNotice(
      String noticeName) async {
    if (await _networkChercher.isConnected) {
      try {
        Response response = await _remoteDataSource
            .getData("${AppConstants.GET_DOWNLOAD_NOTICE_URI}$noticeName");
        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          Uint8List data = response.body;
          return Right(data);
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
