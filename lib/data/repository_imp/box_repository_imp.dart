import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:installateur/domain/model/box.dart';
import 'package:installateur/data/network/failure.dart';
import 'package:installateur/domain/model/image_model.dart';
import '../../app/app_constants.dart';
import '../../domain/model/user_model.dart';
import '../../domain/repository/box_repository.dart';
import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/network_checker.dart';

class BoxRepositoryImp extends GetxService implements BoxRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkChecker _networkChercher;

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
            "${AppConstants.GET_PAGE_BOX_STATUS_URI}$companyId&$status&$page&$size");
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
  Future<Either<Failure, BoxModel>> getBoxById(int id) async {
    if (await _networkChercher.isConnected) {
      try {
        Response response = await _remoteDataSource
            .getData("${AppConstants.GET_BOX_BY_ID_URI}$id");
        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          BoxModel boxModel = BoxModel.fromJson(response.body);
          return Right(boxModel);
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
  Future<Either<Failure, PageImage>> getBoxImages(int id) async {
    if (await _networkChercher.isConnected) {
      try {
        Response response = await _remoteDataSource
            .getData("${AppConstants.GET_BOX_IMAGES_URI}$id");
        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          PageImage pageImage = PageImage.fromJson(response.body);
          return Right(pageImage);
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
  Future<Either<Failure, String>> uploadBoxImages(
      File imageFile1, File imageFile2, int boxId) async {
    print("in methode");

    if (await _networkChercher.isConnected) {
      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse(AppConstants.POST_UPLOAD_BOX_IMAGES_URI));
        request.fields['id'] = boxId.toString();
        request.files
            .add(await http.MultipartFile.fromPath('image1', imageFile1.path));
        request.files
            .add(await http.MultipartFile.fromPath('image2', imageFile2.path));
        request.headers.addAll({"Content-type": "multipart/form-data"});
        var response = await request.send();
        if (response.statusCode == ResponseCode.SUCCESS ||
            response.statusCode == ResponseCode.NO_CONTENT) {
          return const Right("Success");
        } else {
          return left(Failure(ResponseCode.BAD_REQUEST, "400"));
        }
      } on Exception {
        return (left(Failure(ResponseCode.BAD_REQUEST, "in catch")));
      }
    } else {
      return Left(Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT));
    }
  }

  @override
  Future<Either<Failure, BoxModel>> saveBoxReport(
      File? report, int? boxId) async {
    if (await _networkChercher.isConnected) {
      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse(AppConstants.POST_UPLOAD_BOX_REPORT_URI));
        request.fields['id'] = boxId.toString();
        request.files
            .add(await http.MultipartFile.fromPath('file', report!.path));

        request.headers.addAll({"Content-type": "multipart/form-data"});
        var responsePost = await request.send();
        if (responsePost.statusCode == ResponseCode.SUCCESS ||
            responsePost.statusCode == ResponseCode.NO_CONTENT) {
          print("file uploaded");
          Response response = await _remoteDataSource
              .getData("${AppConstants.GET_BOX_BY_ID_URI}$boxId");
          if (response.statusCode == ResponseCode.SUCCESS ||
              response.statusCode == ResponseCode.NO_CONTENT) {
            BoxModel boxModel = BoxModel.fromJson(response.body);
            return Right(boxModel);
          } else {
            return left(
                Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST));
          }
        } else {
          print(" error from file uploaded");

          return left(Failure(ResponseCode.BAD_REQUEST, "400"));
        }
      } on Exception {
        return (left(Failure(ResponseCode.BAD_REQUEST, "in catch")));
      }
    } else {
      return Left(Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT));
    }
  }

  @override
  Future<Either<Failure, BoxModel>> sendBoxReport(
      BoxModel? boxDetails, UserModel? technical) async {
    String serviceId = 'service_jsxofin';
    String templateId = 'template_3uge25l';
    String userId = 'gpcPZMaqGVeU4I5Jb';
    String pdfUrl = AppConstants.BASE_URL +
        AppConstants.DOWNLOAD_REPORT_URI +
        boxDetails!.reportBox!.name
            .toString(); // replace with your PDF file URL
    Uri url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://locahost',
        'content-type': 'application/json',
      },
      body: jsonEncode(
        {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'subject': 'Installation',
            'compony_email': 'sidiahmedhabib@gmail.com',
            'compony_name': boxDetails.companyBox!.name.toString(),
            'technical_name': "${technical!.firstName} ${technical.lastName}",
            'message':
                'We are pleased to inform you that the installation of your new box has been completed successfully. Our technicians have thoroughly tested the box to ensure that it is functioning properly and is ready for use.',
            'starda_email': 'sidiahmedhabib@gmail.com',
            'pdf_url': pdfUrl, // add the PDF file URL here
          },
        },
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Response response = await _remoteDataSource
          .getData("${AppConstants.GET_BOX_ISSEND_URI}${boxDetails.id}");
      if (response.statusCode == ResponseCode.SUCCESS ||
          response.statusCode == ResponseCode.NO_CONTENT) {
        BoxModel boxModel = BoxModel.fromJson(response.body);
        return Right(boxModel);
      } else {
        return left(
            Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST));
      }
    } else {
      return left(
          Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST));
    }
  }
}
