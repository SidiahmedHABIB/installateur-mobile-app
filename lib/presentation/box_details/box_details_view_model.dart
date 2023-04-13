import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/domain/model/box.dart';
import '../../data/network/failure.dart';
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
