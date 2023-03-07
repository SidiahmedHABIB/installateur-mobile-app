import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/fonts_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/big_text_widget.dart';
import 'package:installateur/presentation/widgets_manager/medium_text_widget.dart';
import 'package:installateur/test/testvm.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin {
  testvm vm = testvm();
  double opacityLevel = 0.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  bool selected = false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => selected = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
        color: Colors.red,
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              width: selected ? 450.0 : 450.0,
              height: selected ? 100.0 : 100.0,
              bottom: selected ? 0.0 : -90.0,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                child: Container(
                  color: Colors.blue,
                  child: const Center(child: Text('Tap me')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// confirm dialog
Future dialog() {
  return Get.defaultDialog(
    radius: AppSize.hs10,
    title: "Confirmation",
    titleStyle: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontSize.fs24,
      fontWeight: FontWeightManager.bold,
      color: ColorManager.mainColor,
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
      margin: EdgeInsets.only(top: AppPadding.hp18),
      padding: EdgeInsets.symmetric(
          vertical: AppPadding.hp10, horizontal: AppPadding.wp18 * 2),
      decoration: BoxDecoration(
          color: ColorManager.mainColor,
          borderRadius: BorderRadius.circular(AppSize.hs5)),
      child: MediumTextWidget(
        text: "OUI",
        color: ColorManager.white,
      ),
    ),
    cancel: Container(
      margin: EdgeInsets.only(top: AppPadding.hp18),
      padding: EdgeInsets.symmetric(
          vertical: AppPadding.hp10, horizontal: AppPadding.wp18 * 2),
      decoration: BoxDecoration(
          color: ColorManager.mainColor,
          borderRadius: BorderRadius.circular(AppSize.hs5)),
      child: MediumTextWidget(
        text: "NON",
        color: ColorManager.white,
      ),
    ),
  );
}

// box table model
class Box {
  String name;
  String entity;
  String matricule;
  String nserie;
  Box({
    required this.name,
    required this.entity,
    required this.matricule,
    required this.nserie,
  });
}

List<Box> boxes = [
  Box(
    name: "Strada_060",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_061",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_062",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_063",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_064",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_065",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_066",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_067",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
  Box(
    name: "Strada_068",
    entity: "EE-55-YYk",
    matricule: "245101478529",
    nserie: "8756396252",
  ),
];
