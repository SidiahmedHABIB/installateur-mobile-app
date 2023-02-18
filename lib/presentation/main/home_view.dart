import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:installateur/presentation/main/widgets/intervention_cart.dart';
import 'package:installateur/presentation/main/widgets/planification_cart.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/fonst_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/big_text_widget.dart';
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
            padding: EdgeInsets.only(right: AppPadding.wp14),
            child: IconWidget(
              icon: Icons.notifications,
              size: AppSize.hs25,
            ),
          ),
        ],
      ),
      backgroundColor: ColorManager.white,
      drawer: MyDrawer(),
      body: Column(
        children: [
          //header
          SizedBox(
            height: AppSize.hs20,
          ),
          //liste of planification cart
          SizedBox(
            height: AppSize.hs25 * 1.5,
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => PlanificationCart(
                text: "A planifier",
                onClick: true,
                textSize: FontSize.fs18,
                vpadding: AppSize.hs8,
              ),
              separatorBuilder: (BuildContext context, int index) {
                return Padding(padding: EdgeInsets.only(right: AppSize.ws10));
              },
            ),
          ),

          SizedBox(
            height: AppSize.hs14,
          ),
          //liste of intervention cart
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) => const InterventionCart(),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: AppSize.hs10);
              },
            ),
          ),
        ],
      ),
    );
  }
}
