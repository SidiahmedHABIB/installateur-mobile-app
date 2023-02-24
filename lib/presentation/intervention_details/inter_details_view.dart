import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import 'package:installateur/presentation/resources/fonst_manager.dart';
import 'package:installateur/presentation/widgets_manager/big_text_widget.dart';
import 'package:installateur/presentation/widgets_manager/icon_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';
import 'package:installateur/presentation/widgets_manager/small_text_widget.dart';

import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/expandable_text_widget.dart';

class InterventionDetailsView extends StatelessWidget {
  const InterventionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    void showDate() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
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
    }

    return Scaffold(
      backgroundColor: ColorManager.white,
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
                    IconWidget(
                      icon: CupertinoIcons.back,
                      iconColor: ColorManager.white,
                      size: AppSize.hs25 * 1.3,
                    ),
                    MediumTextWidget(
                      text: "Fiche d'intervention client",
                      color: ColorManager.white,
                      size: FontSize.fs20,
                    ),
                    Container()
                  ],
                )),
            // circle image and title
            Positioned(
              top: AppPadding.hp100 * 1.3,
              left: AppPadding.wp20,
              right: AppPadding.wp20,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: ColorManager.white,
                    radius: AppSize.hs25 * 2.5,
                    child: IconWidget(
                      icon: CupertinoIcons.building_2_fill,
                      iconColor: ColorManager.mainColor,
                      size: AppSize.hs25 * 3,
                    ),
                  ),
                  SizedBox(height: AppSize.hs14),
                  BigTextWidget(
                    text: "Enterpise X",
                    color: ColorManager.white,
                  )
                ],
              ),
            ),
            // white container
            Container(
              margin: EdgeInsets.only(top: Get.height / 2.2 - 60),
              padding: EdgeInsets.only(
                  left: AppPadding.wp20,
                  top: AppPadding.hp20 * 2,
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
                  //infos personnelles
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: AppPadding.hp12),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: AppPadding.hp20 * 2,
                            bottom: AppPadding.hp20,
                            left: AppPadding.wp16,
                            right: AppPadding.wp16,
                          ),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorManager.whiteGrey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // location
                              Row(
                                children: [
                                  IconWidget(
                                    icon: Icons.location_pin,
                                    iconColor: ColorManager.darkGrey,
                                    size: AppSize.hs20,
                                  ),
                                  SizedBox(
                                    width: AppSize.ws20,
                                  ),
                                  MediumTextWidget(
                                    text: "Madrid Espagne",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs16,
                                  )
                                ],
                              ),
                              SizedBox(height: AppSize.hs25),
                              //phone
                              Row(
                                children: [
                                  IconWidget(
                                    icon: Icons.phone,
                                    iconColor: ColorManager.darkGrey,
                                    size: AppSize.hs20,
                                  ),
                                  SizedBox(
                                    width: AppSize.ws20,
                                  ),
                                  MediumTextWidget(
                                    text: "22234136507",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs16,
                                  )
                                ],
                              ),
                              SizedBox(height: AppSize.hs25),

                              //documentation
                              IconWidget(
                                icon: CupertinoIcons.doc_text_fill,
                                iconColor: ColorManager.darkGrey,
                                size: AppSize.hs20,
                              ),
                              SizedBox(height: AppSize.hs10),
                              ExpandableTextWidget(
                                text:
                                    "Are you still experiencing this issue with latest flutter stable? if yes, can you please provide your flutter doctor -v and flutter run --verbose? Also, to better address the issue, would be helpful if you could post a minimal code sample to reproduce the problem Thank you",
                                textSize: FontSize.fs16,
                                maxlines: 2,
                                linkColor: ColorManager.darkGrey,
                                textWeight: FontWeightManager.regular,
                                linkSize: FontSize.fs16,
                                textColor: ColorManager.mainColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: AppMargin.wm5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.white,
                        child: MediumTextWidget(
                          text: "Infos personnelles",
                          color: ColorManager.mainColor,
                          size: FontSize.fs18,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: AppSize.hs16),
                  // rendez vous  field 2
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: AppPadding.hp12),
                        child: Container(
                            padding: EdgeInsets.only(
                              top: AppPadding.hp20 * 2,
                              bottom: AppPadding.hp20,
                              left: AppPadding.wp16,
                              right: AppPadding.wp16,
                            ),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorManager.whiteGrey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: GestureDetector(
                              onTap: () => showDate(),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppPadding.hp16,
                                    horizontal: AppPadding.wp10),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorManager.grey,
                                    width: 2,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(AppSize.hs10),
                                ),
                                child: Row(
                                  children: [
                                    IconWidget(
                                      icon: CupertinoIcons.calendar,
                                      iconColor: ColorManager.grey,
                                      size: AppSize.hs25,
                                    ),
                                    SizedBox(width: AppSize.ws16),
                                    MediumTextWidget(
                                      text:
                                          "Selectionner la date d'intervention",
                                      size: FontSize.fs16,
                                      color: ColorManager.grey,
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: AppMargin.wm5),
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.wp10),
                        color: Colors.white,
                        child: MediumTextWidget(
                          text: "Rendez vous",
                          color: ColorManager.mainColor,
                          size: FontSize.fs18,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: AppSize.hs14),

                  //button
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: AppPadding.hp20),
                    margin: EdgeInsets.only(bottom: AppMargin.hm20),
                    decoration: BoxDecoration(
                      color: ColorManager.darkGrey,
                      borderRadius: BorderRadius.circular(AppSize.hs10),
                    ),
                    child: Center(
                        child: MediumTextWidget(
                      text: "TERMINER",
                      color: ColorManager.white,
                      size: FontSize.fs20,
                    )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
