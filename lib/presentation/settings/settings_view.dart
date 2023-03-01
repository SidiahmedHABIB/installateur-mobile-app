import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/widgets_manager/button_widget.dart';
import 'package:installateur/presentation/widgets_manager/text_field_widget.dart';
import '../drawer/drawer_widgets.dart';
import '../resources/colors_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/medium_text_widget.dart';
import 'widgets/settings_dialogs.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var emailEnterpriseController = TextEditingController();

    return Scaffold(
      //adresse de l'entreprise
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
          text: StringsManager.settingsTitle.tr,
          color: ColorManager.white,
          size: FontSize.fs20,
        ),
      ),
      backgroundColor: ColorManager.white,

      //drawer
      drawer: const MyDrawer(),

      //body
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.wp20),
          child: Column(
            children: [
              SizedBox(height: AppSize.hs20 * 2),
              // Notification
              Container(
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
                  borderRadius: BorderRadius.circular(AppSize.hs10),
                ),
                child: ListTile(
                  horizontalTitleGap: 0,
                  title: MediumTextWidget(
                    text: StringsManager.settingsNotification.tr,
                    size: FontSize.fs18,
                    color: ColorManager.mainColor,
                  ),
                  leading: IconWidget(
                    icon: Icons.notifications,
                    iconColor: ColorManager.mainColor,
                    size: AppSize.hs14 * 2,
                  ),
                  trailing: Switch(
                      // thumb color (round icon)
                      activeColor: ColorManager.mainColor,
                      activeTrackColor: ColorManager.whiteMainColor,
                      inactiveThumbColor: ColorManager.grey,
                      inactiveTrackColor: ColorManager.whiteGrey,
                      splashRadius: 70,
                      // boolean variable value
                      value: true,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      // changes the state of the switch
                      onChanged: (value) => {}),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, "/meteo");
                  },
                ),
              ),
              SizedBox(height: AppSize.hs20),
              //languages
              Container(
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
                  borderRadius: BorderRadius.circular(AppSize.hs10),
                ),
                child: ExpansionTile(
                  iconColor: ColorManager.mainColor,
                  leading: IconWidget(
                    icon: CupertinoIcons.globe,
                    iconColor: ColorManager.mainColor,
                    size: AppSize.hs14 * 2,
                  ),
                  title: MediumTextWidget(
                    text: StringsManager.settingsChangeLang.tr,
                    size: FontSize.fs18,
                    color: ColorManager.mainColor,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      horizontalTitleGap: 0,
                      title: MediumTextWidget(
                        text: StringsManager.settingsChangeLangFr.tr,
                        size: FontSize.fs18,
                        color: ColorManager.mainColor,
                      ),
                      trailing: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: ColorManager.mainColor,
                        checkColor: ColorManager.white,
                        value: true,
                        onChanged: (value) => {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: AppMargin.hm5, horizontal: AppPadding.wp25),
                      width: double.maxFinite,
                      height: AppSize.hs5 / 3,
                      color: ColorManager.mainColor,
                    ),
                    ListTile(
                      horizontalTitleGap: 0,
                      title: MediumTextWidget(
                        text: StringsManager.settingsChangeLangEn.tr,
                        size: FontSize.fs18,
                        color: ColorManager.mainColor,
                      ),
                      trailing: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: ColorManager.mainColor,
                        checkColor: ColorManager.white,
                        value: false,
                        onChanged: (value) => {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: AppMargin.hm5, horizontal: AppPadding.wp25),
                      width: double.maxFinite,
                      height: AppSize.hs5 / 3,
                      color: ColorManager.mainColor,
                    ),
                    ListTile(
                      horizontalTitleGap: 0,
                      title: MediumTextWidget(
                        text: StringsManager.settingsChangeLangEs.tr,
                        size: FontSize.fs18,
                        color: ColorManager.mainColor,
                      ),
                      trailing: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: ColorManager.mainColor,
                        checkColor: ColorManager.white,
                        value: false,
                        onChanged: (value) => {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.hs20),
              //fuseau horaire
              Container(
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
                  borderRadius: BorderRadius.circular(AppSize.hs10),
                ),
                child: ExpansionTile(
                  iconColor: ColorManager.mainColor,
                  leading: IconWidget(
                    icon: CupertinoIcons.globe,
                    iconColor: ColorManager.mainColor,
                    size: AppSize.hs25,
                  ),
                  title: MediumTextWidget(
                    text: StringsManager.settingsHoraire.tr,
                    size: FontSize.fs18,
                    color: ColorManager.mainColor,
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      horizontalTitleGap: 0,
                      title: MediumTextWidget(
                        text: StringsManager.settingsHoraireTitle.tr,
                        size: FontSize.fs18,
                        color: ColorManager.mainColor,
                      ),
                      trailing: Switch(
                          // thumb color (round icon)
                          activeColor: ColorManager.mainColor,
                          activeTrackColor: ColorManager.whiteMainColor,
                          inactiveThumbColor: ColorManager.grey,
                          inactiveTrackColor: ColorManager.whiteGrey,
                          splashRadius: 70,
                          // boolean variable value
                          value: false,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          // changes the state of the switch
                          onChanged: (value) => {}),
                    ),
                    SizedBox(height: AppSize.hs12),
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppSize.ws20, bottom: AppPadding.hp20),
                      child: MediumTextWidget(
                        text: StringsManager.settingsHoraireSemiTitle.tr,
                        color: Colors.blue.shade400,
                        size: FontSize.fs14,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: AppSize.hs20),
              //cheger email
              GestureDetector(
                onTap: () => SettingsDialogs().emailRapportDialog(),
                child: Container(
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
                    borderRadius: BorderRadius.circular(AppSize.hs10),
                  ),
                  child: ListTile(
                    horizontalTitleGap: 0,
                    title: MediumTextWidget(
                      text: StringsManager.settingsChangeMail.tr,
                      size: FontSize.fs18,
                      color: ColorManager.mainColor,
                    ),
                    leading: IconWidget(
                      icon: Icons.email,
                      iconColor: ColorManager.mainColor,
                      size: AppSize.hs14 * 2,
                    ),
                    trailing: IconWidget(
                      icon: CupertinoIcons.forward,
                      iconColor: ColorManager.mainColor,
                      size: AppSize.hs25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.hs20),
              //cheger adresse
              GestureDetector(
                onTap: () => SettingsDialogs().adresseEnterpriseDialog(),
                child: Container(
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
                    borderRadius: BorderRadius.circular(AppSize.hs10),
                  ),
                  child: ListTile(
                    horizontalTitleGap: 0,
                    title: MediumTextWidget(
                      text: StringsManager.settingsChangeLocation.tr,
                      size: FontSize.fs18,
                      color: ColorManager.mainColor,
                    ),
                    leading: IconWidget(
                      icon: CupertinoIcons.map_pin_ellipse,
                      iconColor: ColorManager.mainColor,
                      size: AppSize.hs14 * 2,
                    ),
                    trailing: IconWidget(
                      icon: CupertinoIcons.forward,
                      iconColor: ColorManager.mainColor,
                      size: AppSize.hs25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.hs20),
            ],
          ),
        ),
      ),
    );
  }
}
