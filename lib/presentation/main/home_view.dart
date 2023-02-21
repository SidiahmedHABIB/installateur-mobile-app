import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:installateur/presentation/main/widgets/intervention_cart.dart';
import 'package:installateur/presentation/widgets_manager/text_cart.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/icon_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';

import 'drawer_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
        title: MediumTextWidget(
          text: "Liste des interventions",
          color: ColorManager.white,
          size: FontSize.fs20,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppPadding.wp20),
            child: IconWidget(
              icon: Icons.notifications,
              size: AppSize.hs25 * 1.3,
            ),
          ),
        ],
      ),
      backgroundColor: ColorManager.white,

      //nav bar
      drawer: const MyDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: AppSize.hs20,
          ),
          //liste of planification cart
          Container(
            height: AppSize.hs25 * 1.5,
            // padding: EdgeInsets.only(left: AppPadding.wp20),
            child: ListView.separated(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => TextCart(
                text: "A planifier",
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
