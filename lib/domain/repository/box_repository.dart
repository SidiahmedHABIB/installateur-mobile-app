import 'package:dartz/dartz.dart';
import 'package:installateur/domain/model/box.dart';
import '../../data/network/failure.dart';

abstract class BoxRepository {
  Future<Either<Failure, PageBox>> getPageBoxByCompany(
      int companyId, int page, int size);
  Future<Either<Failure, PageBox>> getPageBoxByStatusAndCompany(
      int companyId, String status, int page, int size);
}
