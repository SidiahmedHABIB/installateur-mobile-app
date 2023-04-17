import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/widgets_manager/big_text_widget.dart';
import 'package:installateur/presentation/widgets_manager/button_widget.dart';
import 'package:installateur/presentation/widgets_manager/loading_widget.dart';
import 'package:installateur/presentation/widgets_manager/text_field_widget.dart';
import '../resources/colors_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/medium_text_widget.dart';
import 'box_details_view_model.dart';

class BoxDetailsView extends StatelessWidget {
  int boxId;
  BoxDetailsView({super.key, required this.boxId});

  @override
  Widget build(BuildContext context) {
    Get.find<BoxDetailsViewModel>().handleGetBoxById(boxId);
    Get.find<BoxDetailsViewModel>().handleGetBoxImages(boxId);
    BoxDetailsViewModel viewModel = Get.find<BoxDetailsViewModel>();

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
                  Navigator.of(context).pop();
                },
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
          text: StringsManager.boxDetailsTilte.tr,
          color: ColorManager.white,
          size: FontSize.fs20,
        ),
      ),

      //boby
      body: GetBuilder<BoxDetailsViewModel>(
        builder: (controller) {
          return controller.loadingPage != true && controller.boxDetails != null
              ? SingleChildScrollView(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    //  box name
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MediumTextWidget(
                                              text:
                                                  "${StringsManager.boxDetailsInfoBoxBox.tr} :",
                                              color: ColorManager.mainColor,
                                              size: FontSize.fs18,
                                            ),
                                            SizedBox(
                                              height: AppSize.hs25,
                                            ),
                                            MediumTextWidget(
                                              text:
                                                  "${StringsManager.boxDetailsInfoBoxEnitie.tr} :",
                                              color: ColorManager.mainColor,
                                              size: FontSize.fs18,
                                            ),
                                            SizedBox(
                                              height: AppSize.hs25,
                                            ),
                                            MediumTextWidget(
                                              text:
                                                  "${StringsManager.boxDetailsInfoBoxNserie.tr} :",
                                              color: ColorManager.mainColor,
                                              size: FontSize.fs18,
                                            ),
                                          ],
                                        ),
                                        //values
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            BigTextWidget(
                                              text: viewModel.boxDetails!.name
                                                  .toString(),
                                              color: ColorManager.mainColor,
                                              size: FontSize.fs18,
                                            ),
                                            SizedBox(
                                              height: AppSize.hs25,
                                            ),
                                            BigTextWidget(
                                              text: viewModel
                                                  .boxDetails!.entity!
                                                  .toString(),
                                              color: ColorManager.mainColor,
                                              size: FontSize.fs18,
                                            ),
                                            SizedBox(
                                              height: AppSize.hs25,
                                            ),
                                            BigTextWidget(
                                              text: viewModel.boxDetails!.nserie
                                                  .toString(),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              color: Colors.white,
                              child: MediumTextWidget(
                                text: StringsManager.boxDetailsInfoBox.tr,
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
                                        textController:
                                            viewModel.matriculController,
                                        onchange: (value) {
                                          controller.updateMatricul(value);
                                        },
                                        hintText: controller
                                                    .boxDetails!.matricul !=
                                                ""
                                            ? controller.boxDetails!.matricul
                                                .toString()
                                            : StringsManager
                                                .boxDetailsInstallHintMatricul
                                                .tr,
                                        icon: CupertinoIcons.car_detailed,
                                        enabled:
                                            controller.boxDetails!.matricul !=
                                                    ""
                                                ? false
                                                : true,
                                      ),
                                      SizedBox(height: AppSize.hs14),
                                      //valuer
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFieldWidget(
                                              textController:
                                                  viewModel.valeurController,
                                              onchange: (value) {
                                                controller.updateValeur(value);
                                              },
                                              hintText: controller
                                                          .boxDetails!.matricul
                                                          .toString() !=
                                                      ""
                                                  ? controller
                                                      .boxDetails!.boxValue
                                                      .toString()
                                                  : StringsManager
                                                      .boxDetailsInstallHintvaleur
                                                      .tr,
                                              icon: CupertinoIcons.speedometer,
                                              enabled: controller.boxDetails!
                                                          .boxValue !=
                                                      ""
                                                  ? false
                                                  : true,
                                            ),
                                          ),
                                          SizedBox(width: AppSize.ws10),
                                          Row(
                                            children: [
                                              IconWidget(
                                                icon: Icons.check_box,
                                                iconColor:
                                                    ColorManager.mainColor,
                                                size: AppSize.hs25,
                                              ),
                                              BigTextWidget(
                                                text: "KM",
                                                color: ColorManager.mainColor,
                                                size: FontSize.fs20,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: AppSize.hs14),
                                      //placement of box
                                      GestureDetector(
                                        onTap: () => Get.toNamed(
                                            RoutesManager.getBoxEmplacement(
                                                controller.boxDetails!.id)),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: AppPadding.hp16,
                                              horizontal: AppSize.ws16),
                                          decoration: BoxDecoration(
                                            color: ColorManager.mainColor,
                                            borderRadius: BorderRadius.circular(
                                                AppSize.hs10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  IconWidget(
                                                    icon: Icons.location_pin,
                                                    iconColor:
                                                        ColorManager.white,
                                                  ),
                                                  SizedBox(width: AppSize.ws10),
                                                  MediumTextWidget(
                                                    text: StringsManager
                                                        .boxDetailsInstallPlaceButton
                                                        .tr,
                                                    color: ColorManager.white,
                                                    fontWeight:
                                                        FontWeightManager
                                                            .regular,
                                                  ),
                                                ],
                                              ),
                                              IconWidget(
                                                  icon: CupertinoIcons.forward)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: AppMargin.wm5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.wp10),
                              color: Colors.white,
                              child: MediumTextWidget(
                                text: StringsManager.boxDetailsInstall.tr,
                                color: ColorManager.redColor,
                                size: FontSize.fs18,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: AppSize.hs25 * 2),
                        SizedBox(height: AppSize.hs25),
                      ],
                    ),
                  ),
                )
              : LoadingWidget(size: AppSize.hs25 * 3);
        },
      ),

      //footer
      bottomNavigationBar: GetBuilder<BoxDetailsViewModel>(
        builder: (controller) {
          return controller.loadingPage != true
              ? Container(
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
                      onClicked: controller.boxMatriculController != "" &&
                              controller.boxValeurController != "" &&
                              controller.boxImages != []
                          ? () => print("done done")
                          : () => {},
                      text: controller.boxDetails != null &&
                              controller.boxDetails!.status ==
                                  AppConstants.NOTINSTALLED
                          ? StringsManager.boxDetailsBottomButtonIns.tr
                          : StringsManager.boxDetailsBottomButtonDes.tr,
                      hdn: controller.boxMatriculController != "" &&
                              controller.boxValeurController != "" &&
                              controller.boxImages != []
                          ? false
                          : true,
                      textSize: FontSize.fs20,
                    ),
                  ),
                )
              : Container(
                  height: AppSize.hs10,
                );
        },
      ),
    );
  }
}
