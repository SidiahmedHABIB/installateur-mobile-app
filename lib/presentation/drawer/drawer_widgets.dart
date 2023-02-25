import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/main/home_view_model.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/fonst_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/big_text_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';

import '../widgets_manager/icon_widget.dart';
import 'drawer_view_model.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
                      ...(DrawerViewModel.menus).map((item) {
                        return ListTile(
                          horizontalTitleGap: AppSize.ws10,
                          // contentPadding:
                          //     EdgeInsets.only(left: AppPadding.wp25 * 2.5),
                          title: MediumTextWidget(
                            text: item['title'],
                            size: FontSize.fs24,
                            color: ColorManager.white,
                            fontWeight: FontWeightManager.regular,
                          ),
                          leading: IconWidget(
                            icon: item['icon'],
                            size: AppSize.hs25 * 1.2,
                          ),
                          onTap: () {
                            Get.back();
                            Get.offNamed('${item['route']}');
                            // Navigator.of(context).pop();
                            // Navigator.pushNamed(context, '${item['route']}');
                          },
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Spacer(),
          SizedBox(height: AppSize.hs100),
          Row(
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
              BigTextWidget(
                text: "Se déconnecter",
                size: FontSize.fs24,
                color: ColorManager.mainColor,
                fontWeight: FontWeightManager.regular,
              ),
            ],
          )
        ],
      ),
    );
  }
}
