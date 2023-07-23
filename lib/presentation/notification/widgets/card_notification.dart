import 'package:flutter/material.dart';
import '../../resources/colors_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/big_text_widget.dart';
import '../../widgets_manager/expandable_text_widget.dart';
import '../../widgets_manager/icon_widget.dart';
import '../../widgets_manager/medium_text_widget.dart';

class CardNotication extends StatelessWidget {
  const CardNotication({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        right: AppMargin.wm20,
        left: AppMargin.wm20,
        top: AppMargin.hm20,
        bottom: AppMargin.hm10,
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppSize.hs14,
        horizontal: AppSize.ws14,
      ),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.hs14),
        boxShadow: [
          BoxShadow(
            color: ColorManager.grey,
            blurRadius: AppSize.hs5,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          //title and discription
          Container(
            padding: EdgeInsets.only(top: AppPadding.hp22 * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                MediumTextWidget(
                  text: "Rappel d'une intervention",
                  color: ColorManager.mainColor,
                  fontWeight: FontWeightManager.semiBold,
                ),
                SizedBox(height: AppSize.hs5),
                //description
                ExpandableTextWidget(
                  text:
                      "votre rendez vous est prévu le 27/02/2023 à 10h votre rendez vous est prévu le 27/02/2023 à 10h",
                  textSize: FontSize.fs16,
                  maxlines: 1,
                ),
              ],
            ),
          ),
          // circle avatar
          Positioned(
            left: 0,
            top: 0,
            child: CircleAvatar(
              backgroundColor: ColorManager.mainColor,
              radius: AppSize.hs16,
              child: IconWidget(
                icon: Icons.notifications,
                iconColor: ColorManager.white,
                size: AppSize.hs20,
              ),
            ),
          ),
          //date of notificaion
          Positioned(
            right: 0,
            top: 0,
            child: BigTextWidget(
              text: "27/02/2023",
              size: FontSize.fs14,
              color: ColorManager.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
