import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/text_field_widget.dart';

import '../widgets_manager/big_text_widget.dart';
import '../widgets_manager/button_widget.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/medium_text_widget.dart';

class BoxDiagnosticView extends StatelessWidget {
  const BoxDiagnosticView({super.key});

  @override
  Widget build(BuildContext context) {
    var commentController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: AppSize.hs100 * 8.2,
            ),
            // header background
            Container(
              width: double.maxFinite,
              height: AppSize.hs100 * 1.2,
              decoration: BoxDecoration(
                color: ColorManager.mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSize.hs14),
                  bottomRight: Radius.circular(AppSize.hs14),
                ),
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
                    text: "Diagnostic du boidier",
                    color: ColorManager.white,
                    size: FontSize.fs20,
                  ),
                  IconWidget(
                    icon: CupertinoIcons.refresh,
                    iconColor: ColorManager.white,
                    size: AppSize.hs25 * 1.3,
                  ),
                ],
              ),
            ),
            // white card
            Positioned(
              top: AppPadding.hp25 * 3.5,
              left: AppPadding.wp25,
              right: AppPadding.wp25,
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: AppMargin.wm20),
                padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.wp10, vertical: AppPadding.hp25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSize.hs8),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.grey,
                      blurRadius: AppSize.hs5,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MediumTextWidget(
                      text: "Boitier :",
                      color: ColorManager.mainColor,
                      size: FontSize.fs18,
                    ),
                    SizedBox(width: AppSize.ws5),
                    BigTextWidget(
                      text: "Strada_066 ",
                      color: ColorManager.mainColor,
                      size: FontSize.fs16,
                    ),
                    SizedBox(width: AppSize.ws10),
                    MediumTextWidget(
                      text: "Entité :",
                      color: ColorManager.mainColor,
                      size: FontSize.fs18,
                    ),
                    SizedBox(width: AppSize.ws5),
                    BigTextWidget(
                      text: "EE-55-yyk",
                      color: ColorManager.mainColor,
                      size: FontSize.fs16,
                    ),
                  ],
                ),
              ),
            ),
            //first cart
            Positioned(
              top: AppPadding.hp100 * 1.85,
              left: AppPadding.wp25,
              right: AppPadding.wp25,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.hs8),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.grey,
                      blurRadius: AppSize.hs5,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // red container
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.wp18,
                        vertical: AppPadding.hp20,
                      ),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: ColorManager.redColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSize.hs14),
                          topRight: Radius.circular(AppSize.hs14),
                        ),
                      ),
                      child: Row(
                        children: [
                          MediumTextWidget(
                            text: "Diagnostic du boidier",
                            color: ColorManager.white,
                            size: FontSize.fs20,
                          ),
                        ],
                      ),
                    ),
                    // white container form
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.wp18,
                        vertical: AppPadding.hp20,
                      ),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(AppSize.hs14),
                          bottomRight: Radius.circular(AppSize.hs14),
                        ),
                      ),
                      child: Column(
                        children: [
                          // VRN
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  MediumTextWidget(
                                    text: "VRN :",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                  SizedBox(width: AppSize.ws5),
                                  BigTextWidget(
                                    text: "XX-XX-XXX ",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconWidget(
                                    icon: Icons.check,
                                    iconColor: Colors.green.shade400,
                                    size: AppSize.hs25,
                                  ),
                                  SizedBox(width: AppSize.ws5),
                                  IconWidget(
                                    icon: CupertinoIcons.exclamationmark,
                                    iconColor: ColorManager.white,
                                    size: AppSize.hs24,
                                    bColor: ColorManager.mainColor,
                                    hp: AppPadding.hp5,
                                    wp: AppPadding.wp5,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: AppSize.hs10),
                          Container(
                            width: double.maxFinite,
                            height: AppSize.hs5 / 3,
                            color: ColorManager.whiteGrey,
                          ),
                          SizedBox(height: AppSize.hs10),
                          // VIN
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  MediumTextWidget(
                                    text: "VIN :",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                  SizedBox(width: AppSize.ws5),
                                  BigTextWidget(
                                    text: " ",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconWidget(
                                    icon: CupertinoIcons.clear,
                                    iconColor: ColorManager.redColor,
                                    size: AppSize.hs25,
                                  ),
                                  SizedBox(width: AppSize.ws5),
                                  IconWidget(
                                    icon: CupertinoIcons.exclamationmark,
                                    iconColor: ColorManager.white,
                                    size: AppSize.hs24,
                                    bColor: ColorManager.mainColor,
                                    hp: AppPadding.hp5,
                                    wp: AppPadding.wp5,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: AppSize.hs10),
                          Container(
                            width: double.maxFinite,
                            height: AppSize.hs5 / 3,
                            color: ColorManager.whiteGrey,
                          ),
                          SizedBox(height: AppSize.hs10),
                          // IMEI
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  MediumTextWidget(
                                    text: "IMEI :",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                  SizedBox(width: AppSize.ws5),
                                  BigTextWidget(
                                    text: " ",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconWidget(
                                    icon: CupertinoIcons.clear,
                                    iconColor: ColorManager.redColor,
                                    size: AppSize.hs25,
                                  ),
                                  SizedBox(width: AppSize.ws5),
                                  IconWidget(
                                    icon: CupertinoIcons.exclamationmark,
                                    iconColor: ColorManager.white,
                                    size: AppSize.hs24,
                                    bColor: ColorManager.mainColor,
                                    hp: AppPadding.hp5,
                                    wp: AppPadding.wp5,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: AppSize.hs10),
                          Container(
                            width: double.maxFinite,
                            height: AppSize.hs5 / 3,
                            color: ColorManager.whiteGrey,
                          ),
                          SizedBox(height: AppSize.hs10),
                          // ICCID
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  MediumTextWidget(
                                    text: "ICCID :",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                  SizedBox(width: AppSize.ws5),
                                  BigTextWidget(
                                    text: " ",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconWidget(
                                    icon: Icons.check,
                                    iconColor: Colors.green.shade400,
                                    size: AppSize.hs25,
                                  ),
                                  SizedBox(width: AppSize.ws5),
                                  IconWidget(
                                    icon: CupertinoIcons.exclamationmark,
                                    iconColor: ColorManager.white,
                                    size: AppSize.hs24,
                                    bColor: ColorManager.mainColor,
                                    hp: AppPadding.hp5,
                                    wp: AppPadding.wp5,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: AppSize.hs20),
                          TextFieldWidget(
                              textController: commentController,
                              hintText: "Ajouter un commentaire",
                              icon: Icons.comment)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // second card
            Positioned(
              top: AppPadding.hp100 * 6,
              left: AppPadding.wp25,
              right: AppPadding.wp25,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.hs8),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.grey,
                      blurRadius: AppSize.hs5,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // red container
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.wp18,
                        vertical: AppPadding.hp20,
                      ),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: ColorManager.redColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSize.hs14),
                          topRight: Radius.circular(AppSize.hs14),
                        ),
                      ),
                      child: Row(
                        children: [
                          MediumTextWidget(
                            text: "Antennes",
                            color: ColorManager.white,
                            size: FontSize.fs20,
                          ),
                        ],
                      ),
                    ),
                    // white container form
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.wp18,
                        vertical: AppPadding.hp20,
                      ),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(AppSize.hs14),
                          bottomRight: Radius.circular(AppSize.hs14),
                        ),
                      ),
                      child: Column(
                        children: [
                          // CSm
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  MediumTextWidget(
                                    text: "CSm :",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                  SizedBox(width: AppSize.ws5),
                                  BigTextWidget(
                                    text: "CSQ > 5",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconWidget(
                                    icon: Icons.check,
                                    iconColor: Colors.green.shade400,
                                    size: AppSize.hs25,
                                  ),
                                  SizedBox(width: AppSize.ws5),
                                  IconWidget(
                                    icon: CupertinoIcons.exclamationmark,
                                    iconColor: ColorManager.white,
                                    size: AppSize.hs24,
                                    bColor: ColorManager.mainColor,
                                    hp: AppPadding.hp5,
                                    wp: AppPadding.wp5,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: AppSize.hs10),
                          Container(
                            width: double.maxFinite,
                            height: AppSize.hs5 / 3,
                            color: ColorManager.whiteGrey,
                          ),
                          SizedBox(height: AppSize.hs10),
                          // GPS
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  MediumTextWidget(
                                    text: "GPS :",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                  SizedBox(width: AppSize.ws5),
                                  BigTextWidget(
                                    text: "Fix OK",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconWidget(
                                    icon: CupertinoIcons.clear,
                                    iconColor: ColorManager.redColor,
                                    size: AppSize.hs25,
                                  ),
                                  SizedBox(width: AppSize.ws5),
                                  IconWidget(
                                    icon: CupertinoIcons.exclamationmark,
                                    iconColor: ColorManager.white,
                                    size: AppSize.hs24,
                                    bColor: ColorManager.mainColor,
                                    hp: AppPadding.hp5,
                                    wp: AppPadding.wp5,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
            text: "VALIDER",
            hdn: true,
            textSize: FontSize.fs20,
          ),
        ),
      ),
    );
  }
}
