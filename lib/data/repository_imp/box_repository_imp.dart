import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:installateur/domain/model/box.dart';
import 'package:installateur/data/network/failure.dart';
import '../../app/app_constants.dart';
import '../../domain/repository/box_repository.dart';
import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/network_checker.dart';

class BoxRepositoryImp extends GetxService implements BoxRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkChercher _networkChercher;

  BoxRepositoryImp(
      this._remoteDataSource, this._localDataSource, this._networkChercher);
  @override
  Future<Either<Failure, PageBox>> getPageBoxByCompany(
      int companyId, int page, int size) async {
    if (await _networkChercher.isConnected) {
      try {
        Response response = await _remoteDataSource.getData(
            "${AppConstants.GET_PAGE_BOX_ALL_URI}$companyId&$page&$size");
        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          PageBox pageBox = PageBox.fromJson(response.body);
          return Right(pageBox);
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
  Future<Either<Failure, PageBox>> getPageBoxByStatusAndCompany(
      int companyId, String status, int page, int size) async {
    if (await _networkChercher.isConnected) {
      try {
        Response response = await _remoteDataSource.getData(
            AppConstants.GET_PAGE_BOX_STATUS_URI +
                "$companyId&$status&$page&$size");
        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          PageBox pageBox = PageBox.fromJson(response.body);
          return Right(pageBox);
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
