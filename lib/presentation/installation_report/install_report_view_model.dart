import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../data/network/failure.dart';
import '../../domain/model/box.dart';
import '../../domain/model/installation_report.dart';
import '../../domain/model/user_model.dart';
import '../../domain/repository/box_repository.dart';
import '../../domain/repository/profile_repository.dart';
import '../report_helper/report_helper.dart';
import '../report_helper/report_widget.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class InstallationReportViewModel extends GetxController {
  final BoxRepository _boxRepository;
  final ProfileRepository _profileRepository;

  InstallationReportViewModel(this._boxRepository, this._profileRepository);
  BoxModel? boxDetails;
  bool loadingPage = false;
  bool openReport = false;
  UserModel? technical;
  File? reportPdf;

  @override
  void onInit() {
    super.onInit();
    handleGetUser();
  }

  Future<void> handleBuildReport() async {
    loadingPage = true;
    update();
    InstallationReport report = await InstallationReport(
        info: InstallationInfo(
            date: DateTime.now(),
            description:
                'Overall, the installation of the box was successful and without incident. The box is now ready to be used for its intended purpose'),
        technical: Technical(
            name: "${technical!.firstName} ${technical!.lastName}",
            address: technical!.email.toString(),
            phone: "46411644"),
        companyReport: CompanyReport(
          name: boxDetails!.interventionBox!.company!.name.toString(),
          address: boxDetails!.interventionBox!.company!.location.toString(),
        ),
        box: [
          BoxInstalled(
            name: boxDetails!.name.toString(),
            date: DateTime.now(),
            entity: boxDetails!.entity.toString(),
            matricul: boxDetails!.matricul.toString(),
            sNumber: boxDetails!.nserie.toString(),
            value: boxDetails!.boxValue.toString(),
          ),
        ]);
    reportPdf =
        await ReportGenerator.generate(boxDetails!.name.toString(), report);
    update();
    openReport = true;
    update();
    Either<Failure, BoxModel> boxDetailsGet =
        await _boxRepository.saveBoxReport(reportPdf, boxDetails!.id);
    if (boxDetailsGet.isRight()) {
      boxDetailsGet.fold(
          (l) => null,
          (r) => {
                boxDetails = r,
                update(),
                loadingPage = false,
                update(),
                showSnackBarWidget(
                    "Report save successfully", ColorManager.mainColor,
                    title: "Success"),
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
    //ReportHelper.openFile(reportPdf);
  }

  Future handleOpenReport() async {
    print("opening");
    ReportHelper.openFile(reportPdf!.path);
    print("opened");
  }

  Future handleSendReportEmail() async {
    loadingPage = true;
    update();
    Either<Failure, BoxModel> boxDetailsGet =
        await _boxRepository.sendBoxReport(boxDetails!, technical);
    if (boxDetailsGet.isRight()) {
      boxDetailsGet.fold(
          (l) => null,
          (r) => {
                boxDetails = r,
                update(),
                loadingPage = false,
                update(),
                showSnackBarWidget(
                    "Messege sent successfully", ColorManager.mainColor,
                    title: "Success"),
              });
    } else {
      boxDetailsGet.fold(
        (l) => {
          loadingPage = false,
          update(),
          showSnackBarWidget(l.message, ColorManager.error),
        },
        (r) => r,
      );
    }
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
                print(boxDetails!.isSend),
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
