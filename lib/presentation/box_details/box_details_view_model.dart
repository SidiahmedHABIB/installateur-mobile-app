import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/domain/model/box.dart';
import '../../data/network/failure.dart';
import '../../domain/model/image_model.dart';
import '../../domain/repository/box_repository.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class BoxDetailsViewModel extends GetxController {
  final BoxRepository _boxRepository;
  BoxDetailsViewModel(this._boxRepository);
  TextEditingController matriculController = TextEditingController();
  String boxMatriculController = "";
  void updateMatricul(String value) {
    boxMatriculController = value;
    update();
  }

  TextEditingController valeurController = TextEditingController();
  String boxValeurController = "";
  void updateValeur(String value) {
    boxValeurController = value;
    update();
  }

  BoxModel? boxDetails;
  bool loadingPage = false;
  List<ImageModel>? boxImages = [];

  Future<void> handleGetBoxImages(int boxId) async {
    loadingPage = true;
    update();
    Either<Failure, PageImage> boxImagesGet =
        await _boxRepository.getBoxImages(boxId);
    if (boxImagesGet.isRight()) {
      boxImagesGet.fold(
          (l) => null,
          (r) => {
                boxImages = r.images,
                update(),
                loadingPage = false,
                update(),
              });
    } else {
      boxImagesGet.fold(
        (l) => {
          showSnackBarWidget(l.message, ColorManager.error),
          loadingPage = false,
          update(),
        },
        (r) => r,
      );
    }
  }

  Future<void> handleGetBoxById(int boxId) async {
    loadingPage = true;
    update();
    Either<Failure, BoxModel> boxDetailsGet =
        await _boxRepository.getBoxById(boxId);
    if (boxDetailsGet.isRight()) {
      boxDetailsGet.fold(
          (l) => null,
          (r) => {
                boxDetails = r,
                update(),
                loadingPage = false,
                update(),
                boxMatriculController = r.matricul.toString(),
                update(),
                boxValeurController = r.boxValue.toString(),
                update()
              });
    } else {
      boxDetailsGet.fold(
        (l) => {
          showSnackBarWidget(l.message, ColorManager.error),
          loadingPage = false,
          update(),
        },
        (r) => r,
      );
    }
  }
}
