import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/data/data_source/local_data_source.dart';
import 'package:installateur/domain/model/intervention.dart';
import 'package:installateur/domain/repository/inter_repository.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import '../../data/network/failure.dart';
import '../../domain/model/user_model.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class HomeViewModel extends GetxController {
  final InterventionRepository _interventionRepository;
  final LocalDataSource _localDataSource;
  HomeViewModel(this._interventionRepository, this._localDataSource);
  List<InterventionModel> interventionToPlanList = [];
  List<InterventionModel> interventionPlannedList = [];
  List<InterventionModel> interventionOnholdList = [];
  bool loadingToPlan = false;
  bool? loadingPlanned;
  bool? loadingOnhold;
  int? uId;
  UserModel? user;

  List<String> planification = [
    StringsManager.homePlanificaionT1.tr,
    StringsManager.homePlanificaionT2.tr,
    StringsManager.homePlanificaionT3.tr,
  ];

  @override
  void onInit() {
    super.onInit();
    handleToPlanIntervention();
    handlePlannedIntervention();
    handleOnholdIntervention();
  }

  Future<void> handleRefreshData() async {
    handleToPlanIntervention();
    handlePlannedIntervention();
    handleOnholdIntervention();
  }

  Future<void> handleToPlanIntervention() async {
    loadingToPlan = true;
    update();
    Either<Failure, PageIntervention> interGet = await _interventionRepository
        .getPageIntervention(AppConstants.TOPLAN, 0, 10);
    if (interGet.isRight()) {
      interGet.fold(
          (l) => null,
          (r) => {
                interventionToPlanList = r.interventions!,
                update(),
                loadingToPlan = false,
                update(),
              });
    } else {
      interGet.fold(
        (l) => {
          showSnackBarWidget(l.message, ColorManager.error),
          loadingToPlan = false,
          update(),
        },
        (r) => r,
      );
    }
  }

  Future<void> handlePlannedIntervention() async {
    uId = _localDataSource.getInt(AppConstants.USER_ID_TOKEN);
    print(uId);
    loadingPlanned = true;
    update();
    Either<Failure, PageIntervention> interGet = await _interventionRepository
        .getPageInterPlannedByUser(uId, AppConstants.PLANNED, 0, 10);
    if (interGet.isRight()) {
      interGet.fold(
          (l) => null,
          (r) => {
                interventionPlannedList = r.interventions!,
                update(),
                loadingPlanned = false,
                update(),
              });
    } else {
      interGet.fold(
        (l) => {
          showSnackBarWidget(l.message, ColorManager.error),
          loadingPlanned = false,
          update(),
        },
        (r) => r,
      );
    }
  }

  Future<void> handleOnholdIntervention() async {
    loadingOnhold = true;
    update();
    Either<Failure, PageIntervention> interGet = await _interventionRepository
        .getPageIntervention(AppConstants.ONHOLD, 0, 10);
    if (interGet.isRight()) {
      interGet.fold(
          (l) => null,
          (r) => {
                interventionOnholdList = r.interventions!,
                update(),
                loadingOnhold = false,
                update(),
              });
    } else {
      interGet.fold(
        (l) => {
          showSnackBarWidget(l.message, ColorManager.error),
          loadingOnhold = false,
          update(),
        },
        (r) => r,
      );
    }
  }
}
