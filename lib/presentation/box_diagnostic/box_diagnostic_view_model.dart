import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';
import '../../data/network/failure.dart';
import '../../domain/model/box.dart';
import '../../domain/model/image_model.dart';
import '../../domain/repository/box_repository.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class BoxDiagnosticViewModel extends GetxController {
  final BoxRepository _boxRepository;
  BoxDiagnosticViewModel(this._boxRepository);

  List<ImageModel>? boxImages = [];
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    boxImages = [];
  }

  bool loadingPage = false;
  BoxModel? boxDetails;
  Future<void> handleGetBoxImages(int boxId) async {
    boxImages = [];
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
                //print(boxImages![1].name),
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

  Future<void> handleInstallBox(BuildContext context) async {
    loadingPage = true;
    update();
    Either<Failure, BoxModel> boxDetailsGet =
        await _boxRepository.installBox(boxDetails!);
    if (boxDetailsGet.isRight()) {
      boxDetailsGet.fold(
          (l) => null,
          (r) => {
                boxDetails = r,
                update(),
                loadingPage = false,
                update(),
                showSnackBarWidget(
                    "Box Installed successfully", ColorManager.mainColor,
                    title: "Done"),
                Navigator.of(context).pop()
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
