import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/colors_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/medium_text_widget.dart';

Future unstallConfirmDialog({
  required BuildContext context,
  required VoidCallback method,
}) {
  return Get.defaultDialog(
    radius: AppSize.hs10,
    title: "Confirmation",
    titleStyle: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontSize.fs24,
      fontWeight: FontWeightManager.bold,
      color: ColorManager.mainColor,
    ),
    middleText: "Voulez vous désinstaller ce boitier",
    middleTextStyle: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontSize.fs18,
      fontWeight: FontWeightManager.regular,
      color: ColorManager.mainColor,
    ),
    backgroundColor: ColorManager.white,
    confirm: GestureDetector(
      onTap: method,
      child: Container(
        margin: EdgeInsets.only(top: AppPadding.hp18),
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.hp10, horizontal: AppPadding.wp18 * 2),
        decoration: BoxDecoration(
            color: ColorManager.mainColor,
            borderRadius: BorderRadius.circular(AppSize.hs5)),
        child: MediumTextWidget(
          text: "OUI",
          color: ColorManager.white,
        ),
      ),
    ),
    cancel: GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        margin: EdgeInsets.only(top: AppPadding.hp18),
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.hp10, horizontal: AppPadding.wp18 * 2),
        decoration: BoxDecoration(
            color: ColorManager.mainColor,
            borderRadius: BorderRadius.circular(AppSize.hs5)),
        child: MediumTextWidget(
          text: "NON",
          color: ColorManager.white,
        ),
      ),
    ),
  );
}
