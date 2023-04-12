import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../model/notice_model.dart';

abstract class NoticeRepository {
  Future<Either<Failure, PageNotice>> getPageNotice(int page, int size);
  Future<Either<Failure, Uint8List>> getDownloadNotice(String noticeName);
}
