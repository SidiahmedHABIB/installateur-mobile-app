import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/installation_report/install_report_view_model.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/widgets_manager/text_field_widget.dart';
import 'package:intl/intl.dart';
import '../../domain/model/installation_report.dart';
import '../report_helper/report_helper.dart';
import '../report_helper/report_widget.dart';
import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/big_text_widget.dart';
import '../widgets_manager/button_widget.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/loading_widget.dart';
import '../widgets_manager/medium_text_widget.dart';
import 'widgets/confirm_dialog.dart';

class InstallationReportView extends StatelessWidget {
  int boxId;
  InstallationReportView({super.key, required this.boxId});
  @override
  Widget build(BuildContext context) {
    Get.find<InstallationReportViewModel>().handleGetBoxById(boxId);
    var emailController = TextEditingController();
    return SafeArea(
      child: Scaffold(
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
                          text: StringsManager.interRapportTitle.tr,
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
                          icon: CupertinoIcons.doc_text_fill,
                          iconColor: ColorManager.mainColor,
                          size: AppSize.hs25 * 3,
                        ),
                      ),
                      SizedBox(height: AppSize.hs14),
                      BigTextWidget(
                        text: "Report",
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
                  child: GetBuilder<InstallationReportViewModel>(
                    builder: (controller) {
                      return controller.loadingPage == false
                          ? Column(
                              children: [
                                // box name
                                TextFieldWidget(
                                  enabled: false,
                                  textController: emailController,
                                  hintText: controller.boxDetails != null
                                      ? controller.boxDetails!.interventionBox!
                                          .company!.name
                                          .toString()
                                      : "",
                                  icon: CupertinoIcons.building_2_fill,
                                  colorhint: ColorManager.mainColor,
                                ),
                                SizedBox(height: AppSize.hs25),
                                // email
                                TextFieldWidget(
                                  enabled: false,
                                  textController: emailController,
                                  hintText: controller.boxDetails != null
                                      ? controller.boxDetails!.interventionBox!
                                          .company!.email
                                          .toString()
                                      : "",
                                  icon: Icons.email,
                                  colorhint: ColorManager.mainColor,
                                ),
                                SizedBox(height: AppSize.hs25),
                                // date calendar
                                TextFieldWidget(
                                  enabled: false,
                                  textController: emailController,
                                  hintText: controller.boxDetails != null
                                      ? DateFormat.yMd().format(DateTime.parse(
                                          controller.boxDetails!.updateAt
                                              .toString()))
                                      : "",
                                  icon: CupertinoIcons.calendar,
                                  colorhint: ColorManager.mainColor,
                                ),
                                SizedBox(height: AppSize.hs25),
                                // button generate report
                                GestureDetector(
                                  onTap: () => controller.boxDetails != null &&
                                          controller.boxDetails!.isSend == false
                                      ? controller.handleBuildReport()
                                      : () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppPadding.hp16,
                                        horizontal: AppPadding.wp10),
                                    width: AppSize.ws100 * 2.5,
                                    decoration: BoxDecoration(
                                      color: controller.boxDetails != null &&
                                              controller.boxDetails!.isSend ==
                                                  false
                                          ? ColorManager.mainColor
                                          : ColorManager.grey,
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
                                      borderRadius:
                                          BorderRadius.circular(AppSize.hs25),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BigTextWidget(
                                          text: "Generate Report",
                                          size: FontSize.fs20,
                                          color: ColorManager.white,
                                        ),
                                        SizedBox(width: AppSize.ws16),
                                        IconWidget(
                                          icon: Icons.file_upload,
                                          iconColor: ColorManager.white,
                                          size: AppSize.hs25,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSize.hs14),
                              ],
                            )
                          : LoadingWidget(size: AppSize.hs25 * 3);
                    },
                  ),
                ),
              ],
            ),
          ),
          //footer
          bottomNavigationBar: GetBuilder<InstallationReportViewModel>(
            builder: (controller) {
              return controller.loadingPage == false
                  ? controller.boxDetails != null &&
                          controller.boxDetails!.isSend == false
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
                              onClicked: () => controller.reportPdf != null
                                  ? controller.handleSendReportEmail()
                                  : {},
                              text: StringsManager.interRapportButton.tr,
                              hdn: controller.reportPdf != null ? false : true,
                              textSize: FontSize.fs20,
                            ),
                          ),
                        )
                      : Container(
                          height: AppSize.hs10,
                        )
                  : Container(
                      height: AppSize.hs10,
                    );
            },
          )),
    );
  }
}
