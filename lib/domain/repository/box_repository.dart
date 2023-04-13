import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:installateur/domain/model/box.dart';
import 'package:installateur/domain/model/image_model.dart';
import '../../data/network/failure.dart';

abstract class BoxRepository {
  Future<Either<Failure, PageBox>> getPageBoxByCompany(
      int companyId, int page, int size);
  Future<Either<Failure, PageBox>> getPageBoxByStatusAndCompany(
      int companyId, String status, int page, int size);
  Future<Either<Failure, BoxModel>> getBoxById(int id);
  Future<Either<Failure, PageImage>> getBoxImages(int id);
  Future<Either<Failure, String>> uploadBoxImages(
      File imageFile1, File imageFile2, int boxId);
}
