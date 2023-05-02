import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../app/app_constants.dart';
import '../../data/data_source/local_data_source.dart';
import '../../data/network/failure.dart';
import '../../domain/model/intervention.dart';
import '../../domain/repository/inter_repository.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class CalendarViewModel extends GetxController {
  final InterventionRepository _interventionRepository;
  final LocalDataSource _localDataSource;
  CalendarViewModel(this._interventionRepository, this._localDataSource);
  List<InterventionModel> interventionPlannedList = [];
  List<InterventionModel> interventionCalenderListe = [];
  bool? loadingPlanned = false;
  int? uId;
  DateTime today = DateTime.now();
  DateTime firstDay = DateTime.utc(2020, 1, 1);
  DateTime lastDay = DateTime.utc(2025, 1, 1);

  @override
  void onInit() {
    super.onInit();
    handlePlannedIntervention();
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    handleCalendarIntervention(day);
    today = day;
    update();
  }

  Future<void> handleCalendarIntervention(DateTime date) async {
    interventionCalenderListe = [];
    interventionPlannedList.forEach((element) {
      if (DateFormat.yMd().format(date) ==
          DateFormat.yMd()
              .format(DateTime.parse(element.appointmentAt.toString()))) {
        interventionCalenderListe.add(element);
      }
    });
    print("length list : ${interventionCalenderListe.length}");
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
}
