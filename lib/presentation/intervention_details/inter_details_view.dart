import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/intervention_details/inter_details_view_model.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import 'package:installateur/presentation/resources/fonts_manager.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/widgets_manager/big_text_widget.dart';
import 'package:installateur/presentation/widgets_manager/icon_widget.dart';
import 'package:installateur/presentation/widgets_manager/loading_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';
import 'package:intl/intl.dart';
import '../../app/app_constants.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/button_widget.dart';
import '../widgets_manager/expandable_text_widget.dart';
import '../widgets_manager/show_alert_dialog.dart';

class InterventionDetailsView extends StatelessWidget {
  int pageId;
  InterventionDetailsView({super.key, required this.pageId});
  @override
  Widget build(BuildContext context) {
    Get.find<InterventionDetailsViewModel>().handleGetInterventionById(pageId);
    InterventionDetailsViewModel viewModel =
        Get.find<InterventionDetailsViewModel>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: GetBuilder<InterventionDetailsViewModel>(
          builder: (controller) {
            return controller.isloading != true
                ? SingleChildScrollView(
                    child: Stack(
                    children: [
                      //image background
                      Positioned(
                        right: 0,
                        left: 0,
                        child: Stack(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(top: AppPadding.hp25 * 2.2),
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
                              padding:
                                  EdgeInsets.only(top: AppPadding.hp25 * 2.2),
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
                          left: AppPadding.wp16,
                          right: AppPadding.wp16,
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
                                text: StringsManager.interDetailTitle.tr,
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
                              backgroundImage: viewModel.interDetails!.company!
                                          .imageCompany !=
                                      null
                                  ? Image.network(AppConstants.BASE_URL +
                                          AppConstants.DOWNLOAD_IMG_URL +
                                          viewModel.interDetails!.company!
                                              .imageCompany!.name
                                              .toString())
                                      .image
                                  : const AssetImage(
                                      AssetsManager.buildingMainColor),
                            ),
                            SizedBox(height: AppSize.hs14),
                            BigTextWidget(
                              text: viewModel.interDetails!.company!.name
                                  .toString(),
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
                                  padding:
                                      EdgeInsets.only(top: AppPadding.hp12),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                              text: viewModel.interDetails!
                                                  .company!.location
                                                  .toString(),
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
                                              text: viewModel
                                                  .interDetails!.company!.phone
                                                  .toString(),
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
                                          text: viewModel.interDetails!.comment
                                              .toString(),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  color: Colors.white,
                                  child: MediumTextWidget(
                                    text:
                                        StringsManager.interDetailInfoPerson.tr,
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
                                  padding:
                                      EdgeInsets.only(top: AppPadding.hp12),
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
                                        onTap: () => controller.interDetails!
                                                    .appointmentAt !=
                                                null
                                            ? {}
                                            : controller
                                                .handleSelectDateTime(context),
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
                                            borderRadius: BorderRadius.circular(
                                                AppSize.hs10),
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
                                                text: controller.interDetails!
                                                            .appointmentAt !=
                                                        null
                                                    ? "${DateFormat.yMd().format(DateTime.parse(controller.interDetails!.appointmentAt.toString()))} - ${DateFormat.jm().format(DateTime.parse(controller.interDetails!.appointmentAt.toString()))}"
                                                    : controller.hiddenButtom !=
                                                            true
                                                        ? controller
                                                            .formattedDate
                                                            .toString()
                                                        : StringsManager
                                                            .interDetailSelectDate
                                                            .tr,
                                                size: FontSize.fs16,
                                                color: controller.interDetails!
                                                            .appointmentAt !=
                                                        null
                                                    ? ColorManager.mainColor
                                                    : controller.hiddenButtom !=
                                                            true
                                                        ? ColorManager.mainColor
                                                        : ColorManager.grey,
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: AppMargin.wm5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppPadding.wp10),
                                  color: Colors.white,
                                  child: MediumTextWidget(
                                    text:
                                        StringsManager.interDetailRendezVous.tr,
                                    color: ColorManager.mainColor,
                                    size: FontSize.fs18,
                                  ),
                                )
                              ],
                            ),

                            SizedBox(height: AppSize.hs14),
                          ],
                        ),
                      ),
                    ],
                  ))
                : LoadingWidget(size: AppSize.hs25 * 3);
          },
        ),
        //footer
        bottomNavigationBar: GetBuilder<InterventionDetailsViewModel>(
          builder: (controller) {
            return controller.isloading != true
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
                        onClicked: () => controller.interDetails!.status ==
                                AppConstants.PLANNED
                            ? Get.toNamed(RoutesManager.getBoxTable(
                                controller.interDetails!.company!.id,
                              ))
                            : controller.interDetails!.appointmentAt != null
                                ? {}
                                : controller.hiddenButtom != true
                                    ? controller.handleAddAppointement()
                                    : ShowAlertDialog(
                                        context: context,
                                        text:
                                            "Fixez votre rendez-vous d'abord"),
                        text: controller.interDetails!.status ==
                                AppConstants.PLANNED
                            ? "INTERVENIR"
                            : StringsManager.interDetailButton.tr,
                        hdn: controller.interDetails!.status ==
                                AppConstants.PLANNED
                            ? false
                            : controller.interDetails!.appointmentAt != null
                                ? true
                                : controller.hiddenButtom,
                        textSize: FontSize.fs20,
                      ),
                    ),
                  )
                : Container(
                    height: AppSize.hs100,
                  );
          },
        ),
      ),
    );
  }
}
