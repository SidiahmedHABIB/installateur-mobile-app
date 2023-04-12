import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/domain/model/box.dart';
import 'package:installateur/domain/repository/box_repository.dart';
import '../../data/network/failure.dart';
import '../resources/colors_manager.dart';
import '../resources/strings_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class BoxTableViewModel extends GetxController {
  final BoxRepository _boxRepository;
  BoxTableViewModel(this._boxRepository);
  TextEditingController searchController = TextEditingController();
  List<String> filteringStrings = [
    StringsManager.boxTableFilter1.tr,
    StringsManager.boxTableFilter2.tr,
    StringsManager.boxTableFilter3.tr,
  ];
  List<String> statusStrings = [
    "",
    AppConstants.INSTALLED,
    AppConstants.NOTINSTALLED,
  ];
  List<bool> buttonActive = [true, false, false];
  List<BoxModel> listOfBoxes = [];
  bool loadingPage = false;
  BoxModel? boxTaked;
  bool clickLine = true;

  // Future<void> handleTakeBoxLine(int index) async {
  //   print(index);
  //   clickLine = false;
  //   update();
  //   boxTaked = listOfBoxes[index];
  //   print(boxTaked?.name);
  // }

  Future<void> handleGetPageBoxByCompany(int companyId) async {
    loadingPage = true;
    update();
    Either<Failure, PageBox> boxPageGet =
        await _boxRepository.getPageBoxByCompany(companyId, 0, 10);
    if (boxPageGet.isRight()) {
      boxPageGet.fold(
          (l) => null,
          (r) => {
                listOfBoxes = r.boxes!,
                update(),
                loadingPage = false,
                update(),
              });
    } else {
      boxPageGet.fold(
        (l) => {
          showSnackBarWidget(l.message, ColorManager.error),
          loadingPage = false,
          update(),
        },
        (r) => r,
      );
    }
  }

  Future<void> handleGetPageBoxByStatusAndCompany(
      int companyId, int index) async {
    loadingPage = true;
    update();
    if (index == 0) {
      buttonActive = [true, false, false];
      update();
      handleGetPageBoxByCompany(companyId);
    } else if (index == 1) {
      buttonActive = [false, true, false];
      update();
      Either<Failure, PageBox> boxPageGet = await _boxRepository
          .getPageBoxByStatusAndCompany(companyId, statusStrings[index], 0, 10);
      if (boxPageGet.isRight()) {
        boxPageGet.fold(
            (l) => null,
            (r) => {
                  listOfBoxes = r.boxes!,
                  update(),
                  loadingPage = false,
                  update(),
                });
      } else {
        boxPageGet.fold(
          (l) => {
            showSnackBarWidget(l.message, ColorManager.error),
            loadingPage = false,
            update(),
          },
          (r) => r,
        );
      }
    } else if (index == 2) {
      buttonActive = [false, false, true];
      update();
      Either<Failure, PageBox> boxPageGet = await _boxRepository
          .getPageBoxByStatusAndCompany(companyId, statusStrings[index], 0, 10);
      if (boxPageGet.isRight()) {
        boxPageGet.fold(
            (l) => null,
            (r) => {
                  listOfBoxes = r.boxes!,
                  update(),
                  loadingPage = false,
                  update(),
                });
      } else {
        boxPageGet.fold(
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
}
