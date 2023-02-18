import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/fonst_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
        )
      ]),
    );
  }
}
