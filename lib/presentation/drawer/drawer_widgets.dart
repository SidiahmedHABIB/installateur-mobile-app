import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/fonts_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/big_text_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';
import '../resources/routes_manager.dart';
import '../widgets_manager/icon_widget.dart';
import 'drawer_view_model.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerViewModel drawerViewModel = Get.find<DrawerViewModel>();

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: ColorManager.white),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.wp25),
                child: Image.asset(AssetsManager.navBarStrada),
              ),
            ),
          ),
          Container(
            color: ColorManager.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                //header
                Center(
                  child: Container(
                    child: Image.asset(AssetsManager.navBarBackground),
                  ),
                ),
                //body
                Container(
                  padding: EdgeInsets.only(left: AppPadding.wp20 * 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //home
                      ListTile(
                        horizontalTitleGap: AppSize.ws10,
                        title: MediumTextWidget(
                          text: StringsManager.drawerTile1.tr,
                          size: FontSize.fs24,
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.regular,
                        ),
                        leading: IconWidget(
                          icon: CupertinoIcons.house_fill,
                          size: AppSize.hs25 * 1.2,
                        ),
                        onTap: () {
                          Get.back();
                          Get.toNamed(RoutesManager.initial);
                        },
                      ),
                      //profile
                      ListTile(
                        horizontalTitleGap: AppSize.ws10,
                        title: MediumTextWidget(
                          text: StringsManager.drawerTile2.tr,
                          size: FontSize.fs24,
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.regular,
                        ),
                        leading: IconWidget(
                          icon: CupertinoIcons.person_fill,
                          size: AppSize.hs25 * 1.2,
                        ),
                        onTap: () {
                          Get.back();
                          Get.toNamed(RoutesManager.profile);
                        },
                      ),
                      //calendar
                      ListTile(
                        horizontalTitleGap: AppSize.ws10,
                        title: MediumTextWidget(
                          text: StringsManager.drawerTile5.tr,
                          size: FontSize.fs24,
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.regular,
                        ),
                        leading: IconWidget(
                          icon: CupertinoIcons.calendar,
                          size: AppSize.hs25 * 1.2,
                        ),
                        onTap: () {
                          Get.back();
                          Get.toNamed(RoutesManager.calendar);
                        },
                      ),
                      //setting
                      ListTile(
                        horizontalTitleGap: AppSize.ws10,
                        title: MediumTextWidget(
                          text: StringsManager.drawerTile3.tr,
                          size: FontSize.fs24,
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.regular,
                        ),
                        leading: IconWidget(
                          icon: CupertinoIcons.gear_alt_fill,
                          size: AppSize.hs25 * 1.2,
                        ),
                        onTap: () {
                          Get.back();
                          Get.toNamed(RoutesManager.setting);
                        },
                      ),
                      //aboutUs
                      ListTile(
                        horizontalTitleGap: AppSize.ws10,
                        title: MediumTextWidget(
                          text: StringsManager.drawerTile4.tr,
                          size: FontSize.fs24,
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.regular,
                        ),
                        leading: IconWidget(
                          icon: CupertinoIcons.info_circle_fill,
                          size: AppSize.hs25 * 1.2,
                        ),
                        onTap: () {
                          Get.back();
                          Get.toNamed(RoutesManager.aboutUs);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Spacer(),
          SizedBox(height: AppSize.hs100),
          GestureDetector(
            onTap: () => drawerViewModel.logout(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(
                  icon: CupertinoIcons.square_arrow_left,
                  iconColor: ColorManager.mainColor,
                  size: AppSize.hs25 * 1.2,
                ),
                SizedBox(
                  width: AppSize.ws14,
                ),
                //logout
                BigTextWidget(
                  text: StringsManager.drawerSignOut.tr,
                  size: FontSize.fs24,
                  color: ColorManager.mainColor,
                  fontWeight: FontWeightManager.regular,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
