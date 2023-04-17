import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../resources/colors_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/icon_widget.dart';
import '../../widgets_manager/medium_text_widget.dart';

Future confirmaDialog(BuildContext context) {
  return Get.defaultDialog(
    radius: AppSize.hs10,
    title: "Rapport d'intervention",
    titleStyle: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontSize.fs22,
      fontWeight: FontWeightManager.bold,
      color: ColorManager.mainColor,
    ),
    content: Column(
      children: [
        IconWidget(
          icon: CupertinoIcons.checkmark_alt_circle,
          iconColor: ColorManager.mainColor,
          size: AppMargin.hm25 * 4,
        ),
        SizedBox(height: AppSize.hs10),
        MediumTextWidget(
          text: "Votre rapport d'intervention a été",
          color: ColorManager.mainColor,
          size: FontSize.fs18,
        ),
        MediumTextWidget(
          text: "envoyer avec succées",
          color: ColorManager.mainColor,
          size: FontSize.fs18,
        ),
      ],
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
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        margin: EdgeInsets.only(top: AppPadding.hp18, bottom: AppPadding.hp10),
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
