import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:installateur/presentation/box_emplacement/widgets/image_card_widget.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';

import '../resources/colors_manager.dart';
import '../resources/fonst_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/big_text_widget.dart';
import '../widgets_manager/button_widget.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/medium_text_widget.dart';
import '../widgets_manager/text_field_widget.dart';

class BoxEmplacementView extends StatelessWidget {
  const BoxEmplacementView({super.key});

  @override
  Widget build(BuildContext context) {
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
          text: "Emlacement",
          color: ColorManager.white,
          size: FontSize.fs20,
        ),
      ),

      //boby
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.hs16 * 2),
            //box location view
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.wp20),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: AppPadding.hp12),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: AppPadding.hp14 * 2,
                        bottom: AppPadding.hp16 * 2,
                        left: AppPadding.wp25,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // title
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigTextWidget(
                                text: "Cliquer sur la zone d'installation",
                                color: ColorManager.mainColor,
                                size: FontSize.fs20,
                              )
                            ],
                          ),
                          SizedBox(height: AppSize.hs16),

                          Column(
                            children: [
                              // side truck image
                              Stack(
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    color: ColorManager.whiteGrey,
                                    child: Image.asset(AssetsManager.truckTop,
                                        fit: BoxFit.cover),
                                  ),
                                  // top red index
                                  Positioned(
                                    top: 0,
                                    left: AppSize.ws25 * 2.7,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: AppPadding.hp5 / 3,
                                          horizontal: AppPadding.wp16),
                                      color: ColorManager.redColor,
                                      child: Column(
                                        children: [
                                          IconWidget(
                                            icon: Icons.circle,
                                            size: AppSize.hs14 * 2,
                                          ),
                                          IconWidget(
                                            icon: CupertinoIcons
                                                .arrowtriangle_down_fill,
                                            size: AppSize.hs16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // bottom red index
                                  Positioned(
                                    bottom: 0,
                                    left: AppSize.ws25 * 2.7,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: AppPadding.hp5 / 3,
                                          horizontal: AppPadding.wp16),
                                      color: ColorManager.redColor,
                                      child: Column(
                                        children: [
                                          IconWidget(
                                            icon: CupertinoIcons
                                                .arrowtriangle_up_fill,
                                            size: AppSize.hs16,
                                          ),
                                          IconWidget(
                                            icon: Icons.circle,
                                            size: AppSize.hs14 * 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              // black horizontal line
                              Container(
                                width: double.maxFinite,
                                height: 2,
                                color: Colors.black,
                              ),

                              // side truck image
                              Container(
                                width: double.maxFinite,
                                color: ColorManager.whiteGrey,
                                child: Image.asset(AssetsManager.truckSide,
                                    fit: BoxFit.cover),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: AppMargin.wm5),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,
                    child: MediumTextWidget(
                      text: "Boitier",
                      color: ColorManager.redColor,
                      size: FontSize.fs18,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: AppSize.hs25),
            // add photos
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.wp20),
              child: Column(
                children: [
                  MediumTextWidget(
                    text: "Ajouter des photos de l'installation",
                    color: ColorManager.mainColor,
                    size: FontSize.fs20,
                  ),
                  SizedBox(height: AppSize.hs14),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(AppSize.hs5),
                    dashPattern: [AppSize.ws8, AppSize.ws5],
                    color: ColorManager.grey,
                    strokeWidth: AppSize.hs5 / 2,
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: AppPadding.hp10),
                      child: IconWidget(
                        icon: CupertinoIcons.camera_fill,
                        iconColor: ColorManager.mainColor,
                        size: AppSize.hs14 * 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.hs20),
            // list of images
            SizedBox(
              height: AppSize.hs100 * 1.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => const ImageCartWidget(),
              ),
            ),
            SizedBox(height: AppSize.hs16),
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
            hdn: false,
            textSize: FontSize.fs20,
          ),
        ),
      ),
    );
  }
}
