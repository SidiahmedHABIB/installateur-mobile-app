import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/main/home_view_model.dart';
import 'package:installateur/presentation/main/widgets/intervention_cart.dart';
import 'package:installateur/presentation/notification/notification_view.dart';
import 'package:installateur/presentation/widgets_manager/text_cart.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/icon_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';

import '../drawer/drawer_widgets.dart';
import '../resources/strings_manager.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  HomeViewModel vm = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //header
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(left: AppPadding.wp20),
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.bars,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            );
          },
        ),
        iconTheme: IconThemeData(
          color: ColorManager.white,
          size: AppSize.hs25 * 1.3,
        ),
        backgroundColor: ColorManager.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(AppSize.hs25),
          ),
        ),
        centerTitle: true,
        //string title
        title: MediumTextWidget(
          text: StringsManager.homePageTitle.tr,
          color: ColorManager.white,
          size: FontSize.fs20,
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(const NotificationView()),
            child: Padding(
              padding: EdgeInsets.only(right: AppPadding.wp20),
              child: IconWidget(
                icon: Icons.notifications,
                size: AppSize.hs25 * 1.3,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: ColorManager.white,
      //nav bar
      drawer: const MyDrawer(),
      //body
      body: Column(
        children: [
          SizedBox(
            height: AppSize.hs20,
          ),
          //liste of planification cart
          SizedBox(
            height: AppSize.hs25 * 1.5,
            // padding: EdgeInsets.only(left: AppPadding.wp20),
            child: ListView.separated(
              itemCount: vm.planification.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => TextCart(
                text: vm.planification[index],
                onClick: index % 2 == 0 ? true : false,
                textSize: FontSize.fs18,
                vpadding: AppSize.hs8,
              ),
              separatorBuilder: (BuildContext context, int index) {
                return Container();
              },
            ),
          ),

          SizedBox(
            height: AppSize.hs10,
          ),
          //liste of intervention cart
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) => const InterventionCart(),
              separatorBuilder: (BuildContext context, int index) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
