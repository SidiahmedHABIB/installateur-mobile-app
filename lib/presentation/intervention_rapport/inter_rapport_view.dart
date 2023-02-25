import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/widgets_manager/text_field_widget.dart';
import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/fonst_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/big_text_widget.dart';
import '../widgets_manager/button_widget.dart';
import '../widgets_manager/icon_widget.dart';
import '../widgets_manager/medium_text_widget.dart';

class InterventionRapportView extends StatelessWidget {
  const InterventionRapportView({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    void showDate() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2030),
        builder: (context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: ColorManager.mainColor, // <-- SEE HERE
                  onPrimary: ColorManager.white, // <-- SEE HERE
                  onSurface: Colors.black, // <-- SEE HERE
                ),
              ),
              child: child!);
        },
      );
    }

    Future dialog() {
      return Get.defaultDialog(
        radius: AppSize.hs10,
        title: "Rapport d'intervention",
        titleStyle: TextStyle(
          fontFamily: FontConstants.fontFamily,
          fontSize: FontSize.fs22,
          fontWeight: FontWeightManager.bold,
          color: ColorManager.mainColor,
        ),
        content: Column(
          children: [
            IconWidget(
              icon: CupertinoIcons.checkmark_alt_circle,
              iconColor: ColorManager.mainColor,
              size: AppMargin.hm25 * 4,
            ),
            SizedBox(height: AppSize.hs10),
            MediumTextWidget(
              text: "Votre rapport d'intervention a été",
              color: ColorManager.mainColor,
              size: FontSize.fs18,
            ),
            MediumTextWidget(
              text: "envoyer avec succées",
              color: ColorManager.mainColor,
              size: FontSize.fs18,
            ),
          ],
        ),
        middleText: "Voulez vous désinstaller ce boitier",
        middleTextStyle: TextStyle(
          fontFamily: FontConstants.fontFamily,
          fontSize: FontSize.fs18,
          fontWeight: FontWeightManager.regular,
          color: ColorManager.mainColor,
        ),
        backgroundColor: ColorManager.white,
        confirm: Container(
          margin:
              EdgeInsets.only(top: AppPadding.hp18, bottom: AppPadding.hp10),
          padding: EdgeInsets.symmetric(
              vertical: AppPadding.hp10, horizontal: AppPadding.wp25 * 2),
          decoration: BoxDecoration(
              color: ColorManager.mainColor,
              borderRadius: BorderRadius.circular(AppSize.hs5)),
          child: MediumTextWidget(
            text: "OK",
            color: ColorManager.white,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //image background
            Positioned(
              right: 0,
              left: 0,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: AppPadding.hp25 * 2.2),
                    width: double.maxFinite,
                    height: Get.height / 2.2,
                    decoration: const BoxDecoration(
                      color: ColorManager.mainColor,
                      //   image: DecorationImage(
                      //       fit: BoxFit.cover,
                      //       image: AssetImage(AssetsManager.settingBackground)),
                    ),
                    child: Image.asset(
                      AssetsManager.settingBackground,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: AppPadding.hp25 * 2.2),
                    width: double.maxFinite,
                    height: Get.height / 2.2,
                    color: const Color.fromARGB(211, 47, 60, 86),
                  ),
                ],
              ),
            ),
            //header
            Positioned(
                top: AppPadding.hp25 * 1.8,
                left: AppPadding.wp20,
                right: AppPadding.wp20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconWidget(
                      icon: CupertinoIcons.back,
                      iconColor: ColorManager.white,
                      size: AppSize.hs25 * 1.3,
                    ),
                    MediumTextWidget(
                      text: "Rapport d'intervention",
                      color: ColorManager.white,
                      size: FontSize.fs20,
                    ),
                    Container()
                  ],
                )),
            // circle image and title
            Positioned(
              top: AppPadding.hp100 * 1.3,
              left: AppPadding.wp20,
              right: AppPadding.wp20,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: ColorManager.white,
                    radius: AppSize.hs25 * 2.5,
                    child: IconWidget(
                      icon: CupertinoIcons.doc_text_fill,
                      iconColor: ColorManager.mainColor,
                      size: AppSize.hs25 * 3,
                    ),
                  ),
                  SizedBox(height: AppSize.hs14),
                  BigTextWidget(
                    text: "Rapport X",
                    color: ColorManager.white,
                  )
                ],
              ),
            ),
            // white container
            Container(
              margin: EdgeInsets.only(top: Get.height / 2.2 - 60),
              padding: EdgeInsets.only(
                  left: AppPadding.wp20,
                  top: AppPadding.hp20 * 4,
                  right: AppPadding.wp20,
                  bottom: AppPadding.hp20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppSize.hs20 * 3),
                ),
              ),
              child: Column(
                children: [
                  // email
                  TextFieldWidget(
                    textController: emailController,
                    hintText: "EnterpriseX@gmail.com",
                    icon: Icons.email,
                    colorhint: ColorManager.mainColor,
                  ),
                  SizedBox(height: AppSize.hs25),
                  // date calendar
                  GestureDetector(
                    onTap: () => dialog(),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppPadding.hp16,
                          horizontal: AppPadding.wp10),
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
                      child: Row(
                        children: [
                          IconWidget(
                            icon: CupertinoIcons.calendar,
                            iconColor: ColorManager.grey,
                            size: AppSize.hs25,
                          ),
                          SizedBox(width: AppSize.ws16),
                          MediumTextWidget(
                            text: "24/02/2023",
                            size: FontSize.fs16,
                            color: ColorManager.mainColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.hs14),
                ],
              ),
            ),
          ],
        ),
      ),
      //footer
      bottomNavigationBar: Container(
        height: AppSize.hs100,
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.hp16, horizontal: AppPadding.wp20),
        decoration: BoxDecoration(
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              blurRadius: AppSize.hs5,
              color: ColorManager.whiteGrey,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: ButtonWidget(
            text: "ENVOYER",
            hdn: true,
            textSize: FontSize.fs20,
          ),
        ),
      ),
    );
  }
}
