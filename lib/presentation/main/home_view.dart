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

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        children: [
          //header
          Container(
            padding: EdgeInsets.only(
              top: AppSize.hs25 * 2.5,
              left: AppSize.ws20,
              right: AppSize.ws20,
              bottom: AppSize.hs20,
            ),
            decoration: BoxDecoration(
                color: ColorManager.mainColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSize.hs25),
                    bottomRight: Radius.circular(AppSize.hs25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWidget(
                  icon: Icons.menu_sharp,
                  size: AppSize.hs25,
                ),
                MediumTextWidget(
                  text: "Liste des interventions",
                  color: ColorManager.white,
                  size: FontSize.fs20,
                ),
                IconWidget(
                  icon: Icons.notifications,
                  size: AppSize.hs25,
                ),
              ],
            ),
          ),
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
            height: AppSize.hs10,
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
