import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/presentation/box_diagnostic/box_diagnostic_view_model.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/loading_widget.dart';
import '../box_emplacement/widgets/image_network_widget.dart';
import '../widgets_manager/big_text_widget.dart';
import '../widgets_manager/button_widget.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/medium_text_widget.dart';

// ignore: must_be_immutable
class BoxDiagnosticView extends StatelessWidget {
  int boxId;
  BoxDiagnosticView({super.key, required this.boxId});
  @override
  Widget build(BuildContext context) {
    Get.find<BoxDiagnosticViewModel>().handleGetBoxById(boxId);
    Get.find<BoxDiagnosticViewModel>().handleGetBoxImages(boxId);

    return SafeArea(
      child: Scaffold(
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
                  height: AppSize.hs100 * 1,
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
                  top: AppPadding.hp14,
                  left: AppPadding.wp20,
                  right: AppPadding.wp20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: IconWidget(
                          icon: CupertinoIcons.back,
                          iconColor: ColorManager.white,
                          size: AppSize.hs25 * 1.3,
                        ),
                      ),
                      MediumTextWidget(
                        text: StringsManager.boxDiagnosticTitle.tr,
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
                //white container
                GetBuilder<BoxDiagnosticViewModel>(builder: (controller) {
                  return controller.loadingPage == false
                      ? Positioned(
                          top: AppPadding.hp25 * 2.7,
                          left: AppPadding.wp25,
                          right: AppPadding.wp25,
                          child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: AppMargin.wm20),
                            padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.wp10,
                                vertical: AppPadding.hp25),
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
                                  text:
                                      "${StringsManager.boxDiagnosticbox.tr} :",
                                  color: ColorManager.mainColor,
                                  size: FontSize.fs18,
                                ),
                                SizedBox(width: AppSize.ws5),
                                BigTextWidget(
                                  text: controller.boxDetails!.name.toString(),
                                  color: ColorManager.mainColor,
                                  size: FontSize.fs16,
                                ),
                                SizedBox(width: AppSize.ws10),
                                MediumTextWidget(
                                  text:
                                      "${StringsManager.boxTableColumnEnitie.tr} :",
                                  color: ColorManager.mainColor,
                                  size: FontSize.fs18,
                                ),
                                SizedBox(width: AppSize.ws5),
                                BigTextWidget(
                                  text:
                                      controller.boxDetails!.entity.toString(),
                                  color: ColorManager.mainColor,
                                  size: FontSize.fs16,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container();
                }),
                //first cart
                GetBuilder<BoxDiagnosticViewModel>(builder: (controller) {
                  return controller.loadingPage == false
                      ? Positioned(
                          top: AppPadding.hp100 * 1.65,
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
                                        text: StringsManager
                                            .boxDiagnosticEnvirment.tr,
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
                                      bottomRight:
                                          Radius.circular(AppSize.hs14),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      // VRN
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              MediumTextWidget(
                                                text: "Matricul :",
                                                color: ColorManager.mainColor,
                                                size: FontSize.fs18,
                                              ),
                                              SizedBox(width: AppSize.ws5),
                                              BigTextWidget(
                                                text: controller
                                                    .boxDetails!.matricul
                                                    .toString(),
                                                color: ColorManager.mainColor,
                                                size: FontSize.fs18,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              controller.boxDetails!.matricul !=
                                                      null
                                                  ? IconWidget(
                                                      icon: Icons.check,
                                                      iconColor:
                                                          Colors.green.shade400,
                                                      size: AppSize.hs25,
                                                    )
                                                  : IconWidget(
                                                      icon:
                                                          CupertinoIcons.clear,
                                                      iconColor:
                                                          ColorManager.redColor,
                                                      size: AppSize.hs25,
                                                    ),
                                              SizedBox(width: AppSize.ws5),
                                              IconWidget(
                                                icon: CupertinoIcons
                                                    .exclamationmark,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              MediumTextWidget(
                                                text: "Value :",
                                                color: ColorManager.mainColor,
                                                size: FontSize.fs18,
                                              ),
                                              SizedBox(width: AppSize.ws5),
                                              BigTextWidget(
                                                text: controller
                                                    .boxDetails!.boxValue
                                                    .toString(),
                                                color: ColorManager.mainColor,
                                                size: FontSize.fs18,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              controller.boxDetails!.boxValue !=
                                                      null
                                                  ? IconWidget(
                                                      icon: Icons.check,
                                                      iconColor:
                                                          Colors.green.shade400,
                                                      size: AppSize.hs25,
                                                    )
                                                  : IconWidget(
                                                      icon:
                                                          CupertinoIcons.clear,
                                                      iconColor:
                                                          ColorManager.redColor,
                                                      size: AppSize.hs25,
                                                    ),
                                              SizedBox(width: AppSize.ws5),
                                              IconWidget(
                                                icon: CupertinoIcons
                                                    .exclamationmark,
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
                                      // Container(
                                      //   width: double.maxFinite,
                                      //   height: AppSize.hs5 / 3,
                                      //   color: ColorManager.whiteGrey,
                                      // ),
                                      // SizedBox(height: AppSize.hs10),
                                      // // IMEI
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Row(
                                      //       children: [
                                      //         MediumTextWidget(
                                      //           text: "IMEI :",
                                      //           color: ColorManager.mainColor,
                                      //           size: FontSize.fs18,
                                      //         ),
                                      //         SizedBox(width: AppSize.ws5),
                                      //         BigTextWidget(
                                      //           text: " ",
                                      //           color: ColorManager.mainColor,
                                      //           size: FontSize.fs18,
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     Row(
                                      //       children: [
                                      //         IconWidget(
                                      //           icon: CupertinoIcons.clear,
                                      //           iconColor:
                                      //               ColorManager.redColor,
                                      //           size: AppSize.hs25,
                                      //         ),
                                      //         SizedBox(width: AppSize.ws5),
                                      //         IconWidget(
                                      //           icon: CupertinoIcons
                                      //               .exclamationmark,
                                      //           iconColor: ColorManager.white,
                                      //           size: AppSize.hs24,
                                      //           bColor: ColorManager.mainColor,
                                      //           hp: AppPadding.hp5,
                                      //           wp: AppPadding.wp5,
                                      //         ),
                                      //       ],
                                      //     )
                                      //   ],
                                      // ),
                                      // SizedBox(height: AppSize.hs10),
                                      // Container(
                                      //   width: double.maxFinite,
                                      //   height: AppSize.hs5 / 3,
                                      //   color: ColorManager.whiteGrey,
                                      // ),
                                      // SizedBox(height: AppSize.hs10),
                                      // // ICCID
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Row(
                                      //       children: [
                                      //         MediumTextWidget(
                                      //           text: "ICCID :",
                                      //           color: ColorManager.mainColor,
                                      //           size: FontSize.fs18,
                                      //         ),
                                      //         SizedBox(width: AppSize.ws5),
                                      //         BigTextWidget(
                                      //           text: " ",
                                      //           color: ColorManager.mainColor,
                                      //           size: FontSize.fs18,
                                      //         ),
                                      //       ],
                                      //     ),
                                      //     Row(
                                      //       children: [
                                      //         IconWidget(
                                      //           icon: Icons.check,
                                      //           iconColor:
                                      //               Colors.green.shade400,
                                      //           size: AppSize.hs25,
                                      //         ),
                                      //         SizedBox(width: AppSize.ws5),
                                      //         IconWidget(
                                      //           icon: CupertinoIcons
                                      //               .exclamationmark,
                                      //           iconColor: ColorManager.white,
                                      //           size: AppSize.hs24,
                                      //           bColor: ColorManager.mainColor,
                                      //           hp: AppPadding.hp5,
                                      //           wp: AppPadding.wp5,
                                      //         ),
                                      //       ],
                                      //     )
                                      //   ],
                                      // ),
                                      // SizedBox(height: AppSize.hs20),
                                      // TextFieldWidget(
                                      //     textController: commentController,
                                      //     hintText: StringsManager
                                      //         .boxDiagnosticEnvirmentAddComment
                                      //         .tr,
                                      //     icon: Icons.comment)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container();
                }),
                // second card
                GetBuilder<BoxDiagnosticViewModel>(builder: (controller) {
                  return controller.loadingPage == false
                      ? Positioned(
                          top: AppPadding.hp100 * 3.85,
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
                                        text: "Location",
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
                                        bottomLeft:
                                            Radius.circular(AppSize.hs14),
                                        bottomRight:
                                            Radius.circular(AppSize.hs14),
                                      ),
                                    ),
                                    child: SizedBox(
                                      height: AppSize.hs100 * 1.2,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller.boxImages!.length,
                                        itemBuilder: (context, index) =>
                                            ImageNetworkWidget(
                                          imageUrl: controller.boxImages != []
                                              ? AppConstants.BASE_URL +
                                                  AppConstants
                                                      .DOWNLOAD_IMG_URL +
                                                  controller
                                                      .boxImages![index].name
                                                      .toString()
                                              : "",
                                        ),
                                      ),
                                    )

                                    // Column(
                                    //   children: [
                                    //     // CSm
                                    //     Row(
                                    //       mainAxisAlignment:
                                    //           MainAxisAlignment.spaceBetween,
                                    //       children: [
                                    //         Row(
                                    //           children: [
                                    //             MediumTextWidget(
                                    //               text: "CSm :",
                                    //               color: ColorManager.mainColor,
                                    //               size: FontSize.fs18,
                                    //             ),
                                    //             SizedBox(width: AppSize.ws5),
                                    //             BigTextWidget(
                                    //               text: "CSQ > 5",
                                    //               color: ColorManager.mainColor,
                                    //               size: FontSize.fs18,
                                    //             ),
                                    //           ],
                                    //         ),
                                    //         Row(
                                    //           children: [
                                    //             IconWidget(
                                    //               icon: Icons.check,
                                    //               iconColor:
                                    //                   Colors.green.shade400,
                                    //               size: AppSize.hs25,
                                    //             ),
                                    //             SizedBox(width: AppSize.ws5),
                                    //             IconWidget(
                                    //               icon: CupertinoIcons
                                    //                   .exclamationmark,
                                    //               iconColor: ColorManager.white,
                                    //               size: AppSize.hs24,
                                    //               bColor: ColorManager.mainColor,
                                    //               hp: AppPadding.hp5,
                                    //               wp: AppPadding.wp5,
                                    //             ),
                                    //           ],
                                    //         )
                                    //       ],
                                    //     ),
                                    //     SizedBox(height: AppSize.hs10),
                                    //     Container(
                                    //       width: double.maxFinite,
                                    //       height: AppSize.hs5 / 3,
                                    //       color: ColorManager.whiteGrey,
                                    //     ),
                                    //     SizedBox(height: AppSize.hs10),
                                    //     // GPS
                                    //     Row(
                                    //       mainAxisAlignment:
                                    //           MainAxisAlignment.spaceBetween,
                                    //       children: [
                                    //         Row(
                                    //           children: [
                                    //             MediumTextWidget(
                                    //               text: "GPS :",
                                    //               color: ColorManager.mainColor,
                                    //               size: FontSize.fs18,
                                    //             ),
                                    //             SizedBox(width: AppSize.ws5),
                                    //             BigTextWidget(
                                    //               text: "Fix OK",
                                    //               color: ColorManager.mainColor,
                                    //               size: FontSize.fs18,
                                    //             ),
                                    //           ],
                                    //         ),
                                    //         Row(
                                    //           children: [
                                    //             IconWidget(
                                    //               icon: CupertinoIcons.clear,
                                    //               iconColor:
                                    //                   ColorManager.redColor,
                                    //               size: AppSize.hs25,
                                    //             ),
                                    //             SizedBox(width: AppSize.ws5),
                                    //             IconWidget(
                                    //               icon: CupertinoIcons
                                    //                   .exclamationmark,
                                    //               iconColor: ColorManager.white,
                                    //               size: AppSize.hs24,
                                    //               bColor: ColorManager.mainColor,
                                    //               hp: AppPadding.hp5,
                                    //               wp: AppPadding.wp5,
                                    //             ),
                                    //           ],
                                    //         )
                                    //       ],
                                    //     ),
                                    //   ],
                                    // ),

                                    ),
                              ],
                            ),
                          ),
                        )
                      : Container();
                }),
                GetBuilder<BoxDiagnosticViewModel>(
                  builder: (controller) {
                    return controller.loadingPage == true
                        ? Positioned(
                            top: Get.height / 2 - 100,
                            left: Get.width / 2 - 25,
                            child: LoadingWidget(size: AppSize.hs25 * 3),
                          )
                        : Container();
                  },
                )
              ],
            ),
          ),

          //footer
          bottomNavigationBar: GetBuilder<BoxDiagnosticViewModel>(
            builder: (controller) {
              return controller.loadingPage == false
                  ? Container(
                      height: AppSize.hs100,
                      padding: EdgeInsets.symmetric(
                          vertical: AppPadding.hp16,
                          horizontal: AppPadding.wp20),
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
                          onClicked: controller.boxDetails!.status ==
                                  AppConstants.NOTINSTALLED
                              ? () => controller.handleInstallBox(context)
                              : () => {},
                          text: controller.boxDetails!.status ==
                                  AppConstants.NOTINSTALLED
                              ? StringsManager.boxDiagnosticBottomButton.tr
                              : "DEPANAGE",
                          hdn: controller.boxDetails!.status ==
                                  AppConstants.NOTINSTALLED
                              ? false
                              : true,
                          textSize: FontSize.fs20,
                        ),
                      ),
                    )
                  : Container(
                      height: 10,
                    );
            },
          )),
    );
  }
}
