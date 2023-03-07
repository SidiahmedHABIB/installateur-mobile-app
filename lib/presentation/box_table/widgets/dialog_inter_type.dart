import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/button_widget.dart';
import 'package:installateur/presentation/widgets_manager/icon_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';

import '../../resources/assets_manager.dart';

class DialogInterventionType extends StatelessWidget {
  const DialogInterventionType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.wp16 * 2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                //background image and clear icon
                Stack(
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
                              text: "BoiterX0 / Entité EK-345-CF",
                              color: ColorManager.mainColor,
                              size: FontSize.fs16,
                            ),
                            SizedBox(height: AppSize.hs20),
                            ButtonWidget(
                              onClicked: () => {},
                              text: "INSTALLER",
                              hdn: false,
                              textSize: FontSize.fs18,
                            ),
                            SizedBox(height: AppSize.hs20),
                            ButtonWidget(
                              onClicked: () => {},
                              text: "DESINSTALLER",
                              hdn: false,
                              textSize: FontSize.fs18,
                            ),
                            SizedBox(height: AppSize.hs20),
                            ButtonWidget(
                              onClicked: () => {},
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
      ),
    );
  }
}
