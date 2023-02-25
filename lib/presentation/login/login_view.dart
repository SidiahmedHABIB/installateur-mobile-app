import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';

import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/fonst_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/button_widget.dart';
import '../widgets_manager/text_field_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorManager.mainColor,
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsManager.background),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromARGB(241, 47, 60, 86),
          ),
        ),
        Container(
          // color: Colors.yellow,
          margin: EdgeInsets.only(top: Get.height / 4.5),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: AppSize.hs100 * 2.6,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Center(
                        child: Container(
                          width: AppSize.hs100 * 2.5,
                          // margin: EdgeInsets.symmetric(horizontal: AppMargin.hm100),
                          padding: EdgeInsets.symmetric(
                            vertical: AppPadding.hp20 * 1.2,
                          ),
                          child: Image.asset(AssetsManager.logoStrada),
                        ),
                      ),
                      DefaultTextStyle(
                        style: const TextStyle(
                            color: ColorManager.redColor,
                            fontSize: 18,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.semiBold),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              "INSTALLATEUR",
                              speed: const Duration(milliseconds: 120),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: Get.height / 2),
            padding: EdgeInsets.only(
                left: AppPadding.wp20,
                top: AppPadding.hp20 * 3,
                right: AppPadding.wp20),
            height: Get.height / 2,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppSize.hs20 * 3),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  TextFieldWidget(
                    textController: emailController,
                    icon: Icons.email,
                    hintText: "Email",
                  ),
                  SizedBox(height: AppSize.hs25),
                  TextFieldWidget(
                    textController: passwordController,
                    icon: CupertinoIcons.lock_fill,
                    hintText: "Mot de passe",
                  ),
                  SizedBox(height: AppSize.hs16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MediumTextWidget(
                        text: "Oublier le mot de passe ?",
                        color: ColorManager.redColor,
                        size: FontSize.fs16,
                      )
                    ],
                  ),
                  SizedBox(height: AppSize.hs16 * 2),
                  ButtonWidget(
                    text: "CONNEXION",
                    hdn: false,
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
