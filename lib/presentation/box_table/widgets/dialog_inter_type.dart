import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/button_widget.dart';
import '../../widgets_manager/icon_widget.dart';
import '../../widgets_manager/medium_text_widget.dart';

Future dialogBoxIntervention({
  required BuildContext context,
  required String? boxName,
  required String? boxEntity,
  required VoidCallback insall,
  required VoidCallback deInsall,
  required VoidCallback depanner,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0x00FFFFFF),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                //background image and clear icon
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: Get.height / 1.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.hs14),
                          image: const DecorationImage(
                            image: AssetImage(AssetsManager.background),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.hs14),
                            color: ColorManager.blurMainColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppPadding.wp8),
                        child: IconWidget(
                          icon: Icons.clear_rounded,
                          iconColor: ColorManager.white,
                          size: AppSize.hs16 * 2,
                        ),
                      )
                    ],
                  ),
                ),
                //white container
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: AppPadding.hp25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(AppSize.hs14),
                            bottomRight: Radius.circular(AppSize.hs14),
                            topLeft: Radius.circular(AppSize.hs25 * 2),
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.wp20),
                        child: Column(
                          children: [
                            SizedBox(height: AppSize.hs25 * 2.5),
                            MediumTextWidget(
                              text: "${boxName} / Entité : ${boxEntity}",
                              color: ColorManager.mainColor,
                              size: FontSize.fs16,
                            ),
                            SizedBox(height: AppSize.hs20),
                            ButtonWidget(
                              onClicked: insall,
                              text: "INSTALLER",
                              hdn: false,
                              textSize: FontSize.fs18,
                            ),
                            SizedBox(height: AppSize.hs20),
                            ButtonWidget(
                              onClicked: deInsall,
                              text: "DESINSTALLER",
                              hdn: false,
                              textSize: FontSize.fs18,
                            ),
                            SizedBox(height: AppSize.hs20),
                            ButtonWidget(
                              onClicked: depanner,
                              text: "DEPPANER",
                              hdn: false,
                              textSize: FontSize.fs18,
                            ),
                            SizedBox(height: AppSize.hs20),
                          ],
                        ),
                      ),
                    ),
                    //icons
                    Padding(
                      padding: EdgeInsets.only(right: AppPadding.wp20),
                      child: IconWidget(
                        icon: CupertinoIcons.wrench_fill,
                        bColor: ColorManager.redColor,
                        iconColor: ColorManager.white,
                        size: AppSize.hs25,
                        hp: AppPadding.hp12,
                        wp: AppPadding.wp12,
                        br: AppSize.hs25 * 2,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    },
  );
}
