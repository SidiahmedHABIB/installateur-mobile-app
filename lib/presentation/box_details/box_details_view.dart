import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:installateur/presentation/widgets_manager/big_text_widget.dart';
import 'package:installateur/presentation/widgets_manager/button_widget.dart';
import 'package:installateur/presentation/widgets_manager/small_text_widget.dart';
import 'package:installateur/presentation/widgets_manager/text_field_widget.dart';

import '../resources/colors_manager.dart';
import '../resources/fonst_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/expandable_text_widget.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/medium_text_widget.dart';

class BoxDetailsView extends StatelessWidget {
  const BoxDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var matriculController = TextEditingController();
    var valeurController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorManager.white,
      // header
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(left: AppPadding.wp20),
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.back,
                ),
                onPressed: () {
                  // Scaffold.of(context).openDrawer();
                },
                // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            );
          },
        ),
        iconTheme: IconThemeData(
          color: ColorManager.white,
          size: AppSize.hs25 * 1.3,
        ),
        //header style
        backgroundColor: ColorManager.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(AppSize.hs10),
          ),
        ),
        centerTitle: true,
        title: MediumTextWidget(
          text: "Fiche du boitier",
          color: ColorManager.white,
          size: FontSize.fs20,
        ),
      ),

      //boby
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.wp20),
          child: Column(
            children: [
              SizedBox(height: AppSize.hs16 * 2),
              //infos box
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
                        right: AppPadding.wp25,
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
                          //  box name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MediumTextWidget(
                                    text: "Boitier :",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                  SizedBox(
                                    height: AppSize.hs25,
                                  ),
                                  MediumTextWidget(
                                    text: "Entité :",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                  SizedBox(
                                    height: AppSize.hs25,
                                  ),
                                  MediumTextWidget(
                                    text: "Numéro de série :",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                ],
                              ),
                              //values
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigTextWidget(
                                    text: "Strada_066",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                  SizedBox(
                                    height: AppSize.hs25,
                                  ),
                                  BigTextWidget(
                                    text: "EE-55-yykk",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                  SizedBox(
                                    height: AppSize.hs25,
                                  ),
                                  BigTextWidget(
                                    text: "87562415987",
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                ],
                              ),
                            ],
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
                      text: "Infos Boitier",
                      color: ColorManager.redColor,
                      size: FontSize.fs18,
                    ),
                  )
                ],
              ),

              SizedBox(height: AppSize.hs25),
              // installation
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: AppPadding.hp12),
                    child: Container(
                        padding: EdgeInsets.only(
                          top: AppPadding.hp20 * 2,
                          bottom: AppPadding.hp14 * 2,
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
                          children: [
                            //matricule
                            TextFieldWidget(
                              textController: matriculController,
                              hintText: "Entrer L'mmatriculation",
                              icon: CupertinoIcons.car_detailed,
                            ),
                            SizedBox(height: AppSize.hs14),
                            //valuer
                            Row(
                              children: [
                                Expanded(
                                  child: TextFieldWidget(
                                    textController: valeurController,
                                    hintText: "Entrer valeur",
                                    icon: CupertinoIcons.speedometer,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.hs5),
                                          ),
                                          activeColor: ColorManager.mainColor,
                                          checkColor: ColorManager.white,
                                          value: true,
                                          onChanged: (value) => {},
                                        ),
                                        BigTextWidget(
                                          text: "KM",
                                          color: ColorManager.mainColor,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.hs5),
                                          ),
                                          activeColor: ColorManager.mainColor,
                                          checkColor: ColorManager.white,
                                          value: false,
                                          onChanged: (value) => {},
                                        ),
                                        BigTextWidget(
                                          text: "HH",
                                          color: ColorManager.mainColor,
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: AppSize.hs14),
                            //placement of box
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppPadding.hp16,
                                  horizontal: AppSize.ws16),
                              decoration: BoxDecoration(
                                color: ColorManager.mainColor,
                                borderRadius:
                                    BorderRadius.circular(AppSize.hs10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconWidget(
                                        icon: Icons.location_pin,
                                        iconColor: ColorManager.white,
                                      ),
                                      SizedBox(width: AppSize.ws10),
                                      MediumTextWidget(
                                        text: "Afficher l'emplacement",
                                        color: ColorManager.white,
                                        fontWeight: FontWeightManager.regular,
                                      ),
                                    ],
                                  ),
                                  IconWidget(icon: CupertinoIcons.forward)
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: AppMargin.wm5),
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.wp10),
                    color: Colors.white,
                    child: MediumTextWidget(
                      text: "Installation",
                      color: ColorManager.redColor,
                      size: FontSize.fs18,
                    ),
                  )
                ],
              ),
              SizedBox(height: AppSize.hs25 * 2),
              //button
              ButtonWidget(text: "DIAGNOSTIC DU BOITIER", hdn: false),
              SizedBox(height: AppSize.hs25),
            ],
          ),
        ),
      ),
    );
  }
}
