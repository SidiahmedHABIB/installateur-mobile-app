import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../data/network/failure.dart';
import '../../domain/model/box.dart';
import '../../domain/model/installation_report.dart';
import '../../domain/model/user_model.dart';
import '../../domain/repository/box_repository.dart';
import '../../domain/repository/profile_repository.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class InstallationReportViewModel extends GetxController {
  final BoxRepository _boxRepository;
  final ProfileRepository _profileRepository;

  InstallationReportViewModel(this._boxRepository, this._profileRepository);
  BoxModel? boxDetails;
  bool loadingPage = false;
  UserModel? technical;

  @override
  void onInit() {
    super.onInit();
    handleGetUser();
  }

  Future<void> handleGetUser() async {
    loadingPage = true;
    update();
    UserModel user = await _profileRepository.getUserFromLocal();
    // ignore: unnecessary_null_comparison
    if (user != null) {
      technical = user;
      update();
      loadingPage = false;
      update();
    } else {
      technical = UserModel();
      update();
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
