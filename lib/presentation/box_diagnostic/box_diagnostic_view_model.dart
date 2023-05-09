import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../data/network/failure.dart';
import '../../domain/model/box.dart';
import '../../domain/repository/box_repository.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class BoxDiagnosticViewModel extends GetxController {
  final BoxRepository _boxRepository;
  BoxDiagnosticViewModel(this._boxRepository);

  bool loadingPage = false;
  BoxModel? boxDetails;
  Future<void> handleInstallBox() async {
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
