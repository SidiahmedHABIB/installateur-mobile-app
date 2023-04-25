import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/fonts_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/splash/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SplashViewModel viewModel = Get.find();
    return SafeArea(
      child: Scaffold(
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsManager.background),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: ColorManager.blurMainColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height / 5,
                ),
                //logo and animation text
                Hero(
                  tag: "container-hero",
                  child: SizedBox(
                    width: AppSize.hs100 * 2.6,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Center(
                          child: TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: 1),
                            duration: const Duration(seconds: 1),
                            builder: (context, double val, child) {
                              return Opacity(
                                opacity: val,
                                child: Container(
                                  width: val * AppSize.hs100 * 2.5,
                                  margin: EdgeInsets.symmetric(
                                      vertical: AppMargin.hm5),
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppPadding.hp20 * 1.2,
                                  ),
                                  child: child,
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 0,
                              child: Image.asset(AssetsManager.logoStrada),
                            ),
                          ),
                          //
                        ),
                        // red text
                        GetBuilder<SplashViewModel>(builder: (controller) {
                          return viewModel.viewText == false
                              ? Container()
                              : DefaultTextStyle(
                                  style: const TextStyle(
                                      color: ColorManager.redColor,
                                      fontSize: 18,
                                      fontFamily: FontConstants.fontFamily,
                                      fontWeight: FontWeightManager.semiBold),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        "INSTALLATEUR",
                                        speed:
                                            const Duration(milliseconds: 100),
                                      ),
                                    ],
                                  ),
                                );
                        })
                      ],
                    ),
                  ),
                ),
                Container(
                  height: Get.height / 2.5,
                ),
                //
              ],
            ),
          ),
          // bottom image
          Positioned(
            bottom: -Get.height,
            child: Center(
              child: //bottom image
                  TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 1),
                builder: (context, double val, child) {
                  return Opacity(
                    opacity: val,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: val * Get.height / 1.15),
                      child: child,
                    ),
                  );
                },
                child: SizedBox(
                  width: Get.width / 1.1,
                  child: Image.asset(AssetsManager.settingBackground),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
