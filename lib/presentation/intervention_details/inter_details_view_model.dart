import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/data/data_source/local_data_source.dart';
import 'package:installateur/domain/model/intervention.dart';
import 'package:intl/intl.dart';
import '../../data/network/failure.dart';
import '../../domain/repository/inter_repository.dart';
import '../resources/colors_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/medium_text_widget.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class InterventionDetailsViewModel extends GetxController {
  final LocalDataSource _localDataSource;
  final InterventionRepository _interventionRepository;
  bool isloading = false;
  InterventionModel? interDetails;
  DateTime selectedDate = DateTime.now();
  bool hiddenButtom = true;
  String? formattedDate;

  InterventionDetailsViewModel(
      this._interventionRepository, this._localDataSource);

  Future<void> handleGetInterventionById(int id) async {
    isloading = true;
    update();
    Either<Failure, InterventionModel> interGet =
        await _interventionRepository.getInterventionById(id);
    if (interGet.isRight()) {
      interGet.fold(
          (l) => null,
          (r) => {
                interDetails = r,
                update(),
                isloading = false,
                update(),
              });
    } else {
      interGet.fold(
        (l) => {
          showSnackBarWidget(l.message, ColorManager.error),
          isloading = false,
          update(),
        },
        (r) => r,
      );
    }
  }

  Future<void> handleAddAppointement() async {
    isloading = true;
    update();
    String? uId = _localDataSource.getString(AppConstants.USER_ID_TOKEN);
    Either<Failure, InterventionModel> interGet =
        await _interventionRepository.addAppointement(
            int.parse(uId!), interDetails!.id, selectedDate.toString());
    if (interGet.isRight()) {
      interGet.fold(
          (l) => null,
          (r) => {
                interDetails = r,
                update(),
                isloading = false,
                update(),
                showSnackBarWidget("successfully", ColorManager.mainColor,
                    title: "Done"),
              });
    } else {
      interGet.fold(
        (l) => {
          showSnackBarWidget(l.message, ColorManager.error),
          isloading = false,
          update(),
        },
        (r) => r,
      );
    }
  }

  Future<void> handleSelectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: ColorManager.mainColor, // <-- SEE HERE
                onPrimary: ColorManager.white, // <-- SEE HERE
                onSurface: Colors.black, // <-- SEE HERE
              ),
            ),
            child: child!);
      },
    );

    if (pickedDate != null) {
      // ignore: use_build_context_synchronously
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate),
        builder: (context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: ColorManager.mainColor, // <-- SEE HERE
                  onPrimary: ColorManager.white, // <-- SEE HERE
                ),
              ),
              child: child!);
        },
      );
      if (pickedTime != null) {
        selectedDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        print('Selected date and time: $selectedDate');
        formattedDate =
            "${DateFormat.yMd().format(selectedDate)} ${DateFormat.jm().format(selectedDate)}";
        update();
        hiddenButtom = false;
        update();
      }
    }
  }
}
