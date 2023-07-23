import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/fonts_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import '../drawer/drawer_widgets.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/medium_text_widget.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
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
                text: StringsManager.drawerTile4.tr,
                color: ColorManager.white,
                size: FontSize.fs20,
              ),
            ),
            backgroundColor: ColorManager.white,
            //drawer
            drawer: const MyDrawer(),
            //body
            body: Container(
              margin: EdgeInsets.all(AppMargin.hm20),
              child: Text(
                  style: TextStyle(
                    fontSize: FontSize.fs16 * 1.1,
                    color: ColorManager.mainColor,
                    fontFamily: FontConstants.fontFamily,
                  ),
                  "automotive boxes, such as infotainment systems, navigation systems, and other electronic components. However, the current system for managing these installations is often manual and time-consuming, leading to delays and frustration for customers. To address these issues, a proposed solution is to develop a mobile app for managing automotive box installation interventions. The app would provide features such as scheduling,communication, inventory management, installation status updates, payment options, and customer feedback. By providing a centralized, automated system, the app can help streamline the installation process, improve communication and transparency, and enhance the customer experience."),
            )));
  }
}
