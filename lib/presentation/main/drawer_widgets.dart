import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:installateur/presentation/main/home_view_model.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/big_text_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';

import '../widgets_manager/icon_widget.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: ColorManager.white),
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...(HomeViewModel.menus).map((item) {
                        return ListTile(
                          title: MediumTextWidget(
                            text: item['title'],
                            size: FontSize.fs24,
                            color: ColorManager.white,
                          ),
                          leading: IconWidget(
                            icon: item['icon'],
                            size: AppSize.hs25 * 1.2,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, '${item['route']}');
                          },
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),

          //footer
          // Spacer(),

          SizedBox(height: 80),
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
