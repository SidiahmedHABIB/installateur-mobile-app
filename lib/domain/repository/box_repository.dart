import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:installateur/domain/model/box.dart';
import 'package:installateur/domain/model/image_model.dart';
import '../../data/network/failure.dart';
import '../model/user_model.dart';

abstract class BoxRepository {
  Future<Either<Failure, PageBox>> getPageBoxByCompany(
      int companyId, int page, int size);
  Future<Either<Failure, PageBox>> getPageBoxByStatusAndCompany(
      int companyId, String status, int page, int size);
  Future<Either<Failure, BoxModel>> getBoxById(int id);
  Future<Either<Failure, BoxModel>> addInstallBoxInfo(BoxModel box);
  Future<Either<Failure, BoxModel>> installBox(BoxModel box);
  Future<Either<Failure, bool>> unstallBox(BoxModel box);
  Future<Either<Failure, PageImage>> getBoxImages(int id);
  Future<Either<Failure, String>> uploadBoxImages(
      File imageFile1, File imageFile2, int boxId);
  Future<Either<Failure, BoxModel>> saveBoxReport(File? report, int? boxId);
  Future<Either<Failure, BoxModel>> sendBoxReport(
      BoxModel boxDetails, UserModel? technical);
}
