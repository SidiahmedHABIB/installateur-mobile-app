import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/colors_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/values_manager.dart';
import 'medium_text_widget.dart';

// ignore: non_constant_identifier_names
Future ShowAlertDialog({required BuildContext context, required String text}) {
  return Get.defaultDialog(
    radius: AppSize.hs10,
    title: "Alert",
    titleStyle: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontSize.fs24,
      fontWeight: FontWeightManager.bold,
      color: ColorManager.mainColor,
    ),
    middleText: text,
    middleTextStyle: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontSize.fs18,
      fontWeight: FontWeightManager.regular,
      color: ColorManager.mainColor,
    ),
    backgroundColor: ColorManager.white,
    confirm: GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        margin: EdgeInsets.only(top: AppPadding.hp18),
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.hp10, horizontal: AppPadding.wp25 * 2),
        decoration: BoxDecoration(
            color: ColorManager.mainColor,
            borderRadius: BorderRadius.circular(AppSize.hs5)),
        child: MediumTextWidget(
          text: "OK",
          color: ColorManager.white,
        ),
      ),
    ),
  );
}
