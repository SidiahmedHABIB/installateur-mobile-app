import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:installateur/domain/model/intervention.dart';
import 'package:installateur/domain/repository/inter_repository.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import '../../data/network/failure.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class HomeViewModel extends GetxController {
  final InterventionRepository _interventionRepository;

  HomeViewModel(this._interventionRepository);
  List<InterventionModel> interventionToPlanList = [];
  List<InterventionModel> interventionPlannedList = [];
  List<InterventionModel> interventionOnholdList = [];
  bool loadingToPlan = false;
  bool? loadingPlanned;
  bool? loadingOnhold;

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

  Future<void> handleToPlanIntervention() async {
    loadingToPlan = true;
    update();
    Either<Failure, PageIntervention> interGet =
        await _interventionRepository.getPageIntervention("TOPLAN", 0, 2);
    if (interGet.isRight()) {
      interGet.fold(
          (l) => null,
          (r) => {
                Timer(Duration(seconds: 10), () {
                  interventionToPlanList = r.interventions!;
                  update();
                  loadingToPlan = false;
                  update();
                }),
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
    loadingPlanned = true;
    update();
    Either<Failure, PageIntervention> interGet =
        await _interventionRepository.getPageIntervention("PLANNED", 0, 2);
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
    Either<Failure, PageIntervention> interGet =
        await _interventionRepository.getPageIntervention("ONHOLD", 0, 2);
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
