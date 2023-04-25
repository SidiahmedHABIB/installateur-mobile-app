import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/presentation/drawer/drawer_widgets.dart';
import 'package:installateur/presentation/profile/profile_view_model.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/widgets_manager/image_dialog_source_widget.dart';
import 'package:installateur/presentation/widgets_manager/loading_widget.dart';
import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/button_widget.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/medium_text_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileViewModel profileViewModel = Get.find<ProfileViewModel>();
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
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
                    top: AppPadding.hp14,
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
                          text: StringsManager.profileTitle.tr,
                          color: ColorManager.white,
                          size: FontSize.fs20,
                        ),
                        Container()
                      ],
                    )),

                // white container
                GetBuilder<ProfileViewModel>(
                  builder: (controller) {
                    return Container(
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
                      child: controller.PageLoading == false
                          ? Column(
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
                                    borderRadius:
                                        BorderRadius.circular(AppSize.hs10),
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
                                        text: controller.profileModel != null
                                            ? "${controller.profileModel!.firstName} ${controller.profileModel!.lastName}"
                                            : "",
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
                                      vertical: AppPadding.hp16,
                                      horizontal: AppPadding.wp10),
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
                                    borderRadius:
                                        BorderRadius.circular(AppSize.hs10),
                                  ),
                                  child: Row(
                                    children: [
                                      IconWidget(
                                        icon: Icons.email,
                                        iconColor: ColorManager.grey,
                                        size: AppSize.hs25,
                                      ),
                                      SizedBox(width: AppSize.ws16),
                                      MediumTextWidget(
                                        text: controller.profileModel != null
                                            ? "${controller.profileModel!.email}"
                                            : "",
                                        size: FontSize.fs18,
                                        color: ColorManager.mainColor,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: AppSize.hs20),
                              ],
                            )
                          : Container(),
                    );
                  },
                ),
                // circle image profile
                GetBuilder<ProfileViewModel>(
                  builder: (controller) {
                    return controller.PageLoading == false
                        ? Center(
                            child: Container(
                              margin: EdgeInsets.only(top: AppMargin.hm100 * 2),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(AppSize.hs100),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorManager.grey,
                                          blurRadius: AppSize.hs5,
                                          offset: const Offset(1, 2),
                                        ),
                                      ],
                                    ),
                                    child: controller.imageFile.isNotEmpty
                                        ? CircleAvatar(
                                            backgroundColor: ColorManager.white,
                                            radius: AppSize.hs25 * 2.9,
                                            backgroundImage: FileImage(
                                                controller.imageFile[0]))
                                        : CircleAvatar(
                                            backgroundColor: ColorManager.white,
                                            radius: AppSize.hs25 * 2.9,
                                            backgroundImage: controller
                                                        .profileModel!
                                                        .imageUser !=
                                                    null
                                                ? Image.network(
                                                    "${AppConstants.BASE_URL}/image/download/${controller.profileModel!.imageUser!.name}",
                                                    fit: BoxFit.cover,
                                                  ).image
                                                : Image.asset(
                                                    AssetsManager.profile,
                                                    fit: BoxFit.cover,
                                                  ).image),
                                  ),
                                  GestureDetector(
                                    onTap: () => imageDialogSourceWidget(
                                      context: context,
                                      gallery: () => profileViewModel
                                          .handlePickImageProfile(
                                              context, ImageSource.gallery),
                                      camera: () => profileViewModel
                                          .handlePickImageProfile(
                                              context, ImageSource.camera),
                                    ),
                                    child: IconWidget(
                                      icon: CupertinoIcons.camera_fill,
                                      bColor: ColorManager.mainColor,
                                      br: AppSize.hs20,
                                      hp: AppPadding.hp8,
                                      wp: AppPadding.hp8,
                                      size: AppSize.hs18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(top: AppMargin.hm100 * 4),
                            child: LoadingWidget(size: AppSize.hs25 * 3));
                  },
                ),
              ],
            ),
          ),
          //footer
          bottomNavigationBar: GetBuilder<ProfileViewModel>(
            builder: (controller) {
              return Container(
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
                    onClicked: controller.imageFile.isNotEmpty
                        ? () => controller.handleUpdateProfile()
                        : () => {},
                    text: StringsManager.profileButton.tr,
                    hdn: controller.imageFile.isNotEmpty ? false : true,
                    textSize: FontSize.fs20,
                  ),
                ),
              );
            },
          )),
    );
  }
}
