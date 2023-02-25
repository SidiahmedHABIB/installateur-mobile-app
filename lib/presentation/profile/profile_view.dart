import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:installateur/presentation/drawer/drawer_widgets.dart';

import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/big_text_widget.dart';
import '../widgets_manager/button_widget.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/medium_text_widget.dart';
import '../widgets_manager/text_field_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorManager.white,
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //image background
            Positioned(
              right: 0,
              left: 0,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: AppPadding.hp25 * 2.2),
                    width: double.maxFinite,
                    height: Get.height / 2.2,
                    decoration: const BoxDecoration(
                      color: ColorManager.mainColor,
                      //   image: DecorationImage(
                      //       fit: BoxFit.cover,
                      //       image: AssetImage(AssetsManager.settingBackground)),
                    ),
                    child: Image.asset(
                      AssetsManager.settingBackground,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: AppPadding.hp25 * 2.2),
                    width: double.maxFinite,
                    height: Get.height / 2.2,
                    color: const Color.fromARGB(211, 47, 60, 86),
                  ),
                ],
              ),
            ),
            //header
            Positioned(
                top: AppPadding.hp25 * 1.8,
                left: AppPadding.wp20,
                right: AppPadding.wp20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState?.openDrawer();
                        // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip;
                      },
                      child: IconWidget(
                        icon: Icons.menu,
                        iconColor: ColorManager.white,
                        size: AppSize.hs25 * 1.3,
                      ),
                    ),
                    MediumTextWidget(
                      text: "Profil",
                      color: ColorManager.white,
                      size: FontSize.fs20,
                    ),
                    Container()
                  ],
                )),

            // white container
            Container(
              margin: EdgeInsets.only(top: Get.height / 2.2 - 100),
              padding: EdgeInsets.only(
                  left: AppPadding.wp20,
                  top: AppPadding.hp20 * 4,
                  right: AppPadding.wp20,
                  bottom: AppPadding.hp20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppSize.hs20 * 3),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: AppSize.hs25),
                  //name
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppPadding.hp16,
                      horizontal: AppPadding.wp10,
                    ),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      border: Border.all(
                        color: ColorManager.whiteGrey,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.grey,
                          blurRadius: AppSize.hs5,
                          offset: const Offset(1, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(AppSize.hs10),
                    ),
                    child: Row(
                      children: [
                        IconWidget(
                          icon: CupertinoIcons.person_fill,
                          iconColor: ColorManager.grey,
                          size: AppSize.hs25,
                        ),
                        SizedBox(width: AppSize.ws16),
                        MediumTextWidget(
                          text: "Sidi Ahmed",
                          size: FontSize.fs18,
                          color: ColorManager.mainColor,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.hs20),
                  //resault
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: AppPadding.hp16, horizontal: AppPadding.wp10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      border: Border.all(
                        color: ColorManager.whiteGrey,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.grey,
                          blurRadius: AppSize.hs5,
                          offset: const Offset(1, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(AppSize.hs10),
                    ),
                    child: Row(
                      children: [
                        IconWidget(
                          icon: CupertinoIcons.person_fill,
                          iconColor: ColorManager.grey,
                          size: AppSize.hs25,
                        ),
                        SizedBox(width: AppSize.ws16),
                        MediumTextWidget(
                          text: "Reault",
                          size: FontSize.fs18,
                          color: ColorManager.mainColor,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.hs20),
                ],
              ),
            ),
            // circle image profile
            Center(
              child: Container(
                margin: EdgeInsets.only(top: AppMargin.hm100 * 2),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.hs100),
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.grey,
                            blurRadius: AppSize.hs5,
                            offset: const Offset(1, 2),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: ColorManager.white,
                        radius: AppSize.hs25 * 2.5,
                        child: IconWidget(
                          icon: CupertinoIcons.person_fill,
                          iconColor: ColorManager.mainColor,
                          size: AppSize.hs25 * 4,
                        ),
                      ),
                    ),
                    IconWidget(
                      icon: CupertinoIcons.camera_fill,
                      bColor: ColorManager.mainColor,
                      br: AppSize.hs20,
                      hp: AppPadding.hp8,
                      wp: AppPadding.hp8,
                      size: AppSize.hs18,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      //footer
      bottomNavigationBar: Container(
        height: AppSize.hs100,
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.hp16, horizontal: AppPadding.wp20),
        decoration: BoxDecoration(
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              blurRadius: AppSize.hs5,
              color: ColorManager.whiteGrey,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: ButtonWidget(
            text: "ENREGISTRER",
            hdn: true,
            textSize: FontSize.fs20,
          ),
        ),
      ),
    );
  }
}
