import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resources/colors_manager.dart';
import '../../resources/fonst_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/medium_text_widget.dart';
import '../../widgets_manager/text_field_widget.dart';

class SettingsDialogs {
  var emailEnterpriseController = TextEditingController();
  //change email rapport dialoge
  Future emailRapportDialog() {
    return Get.defaultDialog(
      radius: AppSize.hs10,
      title: "Rapport d'intervention",
      titleStyle: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontSize.fs20,
        fontWeight: FontWeightManager.bold,
        color: ColorManager.mainColor,
      ),
      content: Column(
        children: [
          SizedBox(height: AppSize.hs25),
          TextFieldWidget(
              textController: emailEnterpriseController,
              hintText: "sidiahmedhabib@gmail.com",
              icon: Icons.email),
          SizedBox(height: AppSize.hs25),

          //button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: AppPadding.hp18),
                padding: EdgeInsets.symmetric(
                    vertical: AppPadding.hp10, horizontal: AppPadding.wp20),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorManager.mainColor, width: AppSize.hs5 / 3),
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.hs5)),
                child: MediumTextWidget(
                  text: "ANNULER",
                  color: ColorManager.mainColor,
                ),
              ),
              SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(top: AppPadding.hp18),
                padding: EdgeInsets.symmetric(
                    vertical: AppPadding.hp10, horizontal: AppPadding.wp10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorManager.darkGrey, width: AppSize.hs5 / 3),
                    color: ColorManager.darkGrey,
                    borderRadius: BorderRadius.circular(AppSize.hs5)),
                child: MediumTextWidget(
                  text: "ENREGISTRER",
                  color: ColorManager.white,
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: ColorManager.white,
    );
  }

//change adresse entreprise dialoge
  Future adresseEnterpriseDialog() {
    return Get.defaultDialog(
      radius: AppSize.hs10,
      title: "Adresse de l'entreprise",
      titleStyle: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontSize.fs20,
        fontWeight: FontWeightManager.bold,
        color: ColorManager.mainColor,
      ),
      content: Column(
        children: [
          SizedBox(height: AppSize.hs25),
          TextFieldWidget(
              textController: emailEnterpriseController,
              hintText: "Nouakchott Mauritanie",
              icon: Icons.email),
          SizedBox(height: AppSize.hs25),

          //button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: AppPadding.hp18),
                padding: EdgeInsets.symmetric(
                    vertical: AppPadding.hp10, horizontal: AppPadding.wp20),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorManager.mainColor, width: AppSize.hs5 / 3),
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.hs5)),
                child: MediumTextWidget(
                  text: "ANNULER",
                  color: ColorManager.mainColor,
                ),
              ),
              SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(top: AppPadding.hp18),
                padding: EdgeInsets.symmetric(
                    vertical: AppPadding.hp10, horizontal: AppPadding.wp10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorManager.grey, width: AppSize.hs5 / 3),
                    color: ColorManager.grey,
                    borderRadius: BorderRadius.circular(AppSize.hs5)),
                child: MediumTextWidget(
                  text: "ENREGISTRER",
                  color: ColorManager.white,
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: ColorManager.white,
    );
  }
}
