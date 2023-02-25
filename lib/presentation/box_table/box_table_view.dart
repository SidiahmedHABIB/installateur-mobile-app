import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:installateur/presentation/widgets_manager/button_widget.dart';
import 'package:installateur/presentation/widgets_manager/text_field_widget.dart';

import '../../test.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/medium_text_widget.dart';
import '../widgets_manager/text_cart.dart';
import 'widgets/fixed_column_widget.dart';
import 'widgets/scrollable_column_widget.dart';

class BoxTableView extends StatelessWidget {
  const BoxTableView({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return Scaffold(
      //header
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(left: AppPadding.wp20),
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.back,
                ),
                onPressed: () {
                  // Scaffold.of(context).openDrawer();
                },
                // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            );
          },
        ),
        iconTheme: IconThemeData(
          color: ColorManager.white,
          size: AppSize.hs25 * 1.3,
        ),
        //header style
        backgroundColor: ColorManager.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(AppSize.hs10),
          ),
        ),
        centerTitle: true,
        title: MediumTextWidget(
          text: "Liste des boitiers",
          color: ColorManager.white,
          size: FontSize.fs20,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppPadding.wp20),
            child: IconWidget(
              icon: CupertinoIcons.wrench_fill,
              size: AppSize.hs25 * 1.3,
            ),
          ),
        ],
      ),
      //backgroundColor
      backgroundColor: ColorManager.white,
      body: Column(
        children: [
          SizedBox(height: AppSize.hs16),
          // search container
          Container(
            padding: EdgeInsets.symmetric(
              vertical: AppPadding.hp10,
              horizontal: AppPadding.wp20,
            ),
            child: TextFieldWidget(
              textController: searchController,
              hintText: "Recherch",
              icon: CupertinoIcons.search,
            ),
          ),
          SizedBox(height: AppSize.hs20),
          // list filtering box cart
          Container(
            height: AppSize.hs25 * 1.5,
            // padding: EdgeInsets.only(left: AppPadding.wp20),
            child: ListView.separated(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => TextCart(
                text: "Tous",
                onClick: index % 2 == 0 ? true : false,
                textSize: FontSize.fs18,
                vpadding: AppSize.hs8,
                hpadding: AppSize.ws16,
              ),
              separatorBuilder: (BuildContext context, int index) {
                return Container();
              },
            ),
          ),
          SizedBox(height: AppSize.hs20),

          // table of boxes
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FixedColumnWidget(),
                    ScrollableColumnWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: AppSize.hs100 * 1,
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.hp16, horizontal: AppPadding.wp20),
        decoration: BoxDecoration(
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              blurRadius: AppSize.hs10,
              color: ColorManager.darkGrey,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: ButtonWidget(
            text: "RAPPORT D'INSTALLATION",
            hdn: true,
            textSize: FontSize.fs20,
          ),
        ),
      ),
    );
  }
}
