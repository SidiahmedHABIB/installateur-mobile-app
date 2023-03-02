import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';
import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/values_manager.dart';
import '../widgets_manager/button_widget.dart';
import '../widgets_manager/text_field_widget.dart';

class LoginView extends StatelessWidget {
  String contaierHero;
  LoginView({super.key, required this.contaierHero});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorManager.mainColor,
      body: Stack(children: [
        //background
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
        //logo and red text
        Hero(
          tag: contaierHero,
          child: Container(
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
                            width: AppSize.hs100 * 2.6,
                            padding: EdgeInsets.symmetric(
                              vertical: AppPadding.hp20 * 1.2,
                            ),
                            child: Image.asset(AssetsManager.logoStrada),
                          ),
                        ),
                        SizedBox(height: AppSize.hs5),
                        MediumTextWidget(
                            text: "INSTALLATEUR",
                            color: ColorManager.redColor,
                            size: FontSize.fs18,
                            fontWeight: FontWeightManager.semiBold),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //white container
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
                  //email
                  TextFieldWidget(
                    textController: emailController,
                    icon: Icons.email,
                    hintText: StringsManager.loginEmail.tr,
                  ),
                  SizedBox(height: AppSize.hs25),
                  //password
                  TextFieldWidget(
                    textController: passwordController,
                    icon: CupertinoIcons.lock_fill,
                    hintText: StringsManager.loginPassword.tr,
                  ),
                  SizedBox(height: AppSize.hs16),
                  //forget password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MediumTextWidget(
                        text: StringsManager.loginForgetPassword.tr,
                        color: ColorManager.redColor,
                        size: FontSize.fs16,
                      )
                    ],
                  ),
                  //button
                  SizedBox(height: AppSize.hs16 * 2),
                  GestureDetector(
                    onTap: () => Get.toNamed(RoutesManager.getInitial()),
                    child: ButtonWidget(
                      text: StringsManager.loginbottombotton.tr,
                      hdn: false,
                    ),
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
