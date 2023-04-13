import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/network/failure.dart';
import '../../domain/model/image_model.dart';
import '../../domain/repository/box_repository.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class BoxEmplacementViewModel extends GetxController {
  final BoxRepository _boxRepository;

  BoxEmplacementViewModel(this._boxRepository);
  bool loadingPage = false;
  List<ImageModel>? boxImages = [];
  List<File> imagePiked = [];

  Future<void> handleDeletePickImage(int index) async {
    print(index);
    imagePiked.removeAt(index);
    update();
  }

  Future<void> handlePickImage(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imagePiked.add(File(pickedFile.path));
      update();
      print("susses: image picker");
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } else {
      print("error: image picker");
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  }

  Future<void> handleBoxUploadImages(int boxId) async {
    loadingPage = true;
    update();
    Either<Failure, String> boxImagesGet = await _boxRepository.uploadBoxImages(
        imagePiked[0], imagePiked[1], boxId);
    if (boxImagesGet.isRight()) {
      boxImagesGet.fold(
          (l) => null,
          (r) => {
                loadingPage = false,
                update(),
                imagePiked = [],
                handleGetBoxImages(boxId),
                showSnackBarWidget("Images Uploaded", ColorManager.mainColor,
                    title: r),
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
                print(boxImages!.length),
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
}
