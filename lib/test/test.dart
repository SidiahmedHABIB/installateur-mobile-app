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
class Team {
  Team({
    required this.position,
    required this.name,
    required this.points,
    required this.played,
    required this.won,
    required this.drawn,
    required this.lost,
    required this.against,
    required this.gd,
  });

  final int position;
  final String name;
  final int points;
  final int played;
  final int won;
  final int drawn;
  final int lost;
  final int against;
  final int gd;
}

List<Team> teamsData = [
  Team(
      position: 1,
      name: 'Atletico Madrid',
      points: 11,
      played: 5,
      won: 525415241,
      drawn: 2,
      lost: 0,
      against: 4,
      gd: 3),
  Team(
      position: 2,
      name: 'Real Madrid',
      points: 10,
      played: 4,
      won: 3,
      drawn: 1,
      lost: 0,
      against: 6,
      gd: 7),
  Team(
      position: 3,
      name: 'Valencia',
      points: 10,
      played: 4,
      won: 3,
      drawn: 2,
      lost: 0,
      against: 2,
      gd: 7),
  Team(
      position: 4,
      name: 'Athletic Bilbao',
      points: 9,
      played: 5,
      won: 2,
      drawn: 3,
      lost: 0,
      against: 1,
      gd: 3),
  Team(
      position: 5,
      name: 'Real Sociedad',
      points: 9,
      played: 4,
      won: 3,
      drawn: 0,
      lost: 1,
      against: 4,
      gd: 2),
  Team(
      position: 6,
      name: 'Osasuna',
      points: 8,
      played: 5,
      won: 2,
      drawn: 2,
      lost: 1,
      against: 6,
      gd: 0),
  Team(
      position: 7,
      name: 'Mallorca',
      points: 8,
      played: 5,
      won: 2,
      drawn: 2,
      lost: 1,
      against: 3,
      gd: 0),
  Team(
      position: 8,
      name: 'Sevilla',
      points: 7,
      played: 3,
      won: 2,
      drawn: 1,
      lost: 0,
      against: 1,
      gd: 4),
  Team(
      position: 9,
      name: 'Rayo Vallecano',
      points: 7,
      played: 5,
      won: 2,
      drawn: 1,
      lost: 2,
      against: 5,
      gd: 3),
  Team(
      position: 10,
      name: 'Barcelona',
      points: 7,
      played: 3,
      won: 2,
      drawn: 1,
      lost: 0,
      against: 4,
      gd: 3),
  Team(
      position: 11,
      name: 'Elche',
      points: 6,
      played: 5,
      won: 1,
      drawn: 3,
      lost: 1,
      against: 3,
      gd: 0),
  Team(
      position: 12,
      name: 'Real Betis',
      points: 5,
      played: 4,
      won: 1,
      drawn: 2,
      lost: 1,
      against: 4,
      gd: 0),
  Team(
      position: 13,
      name: 'Cadiz',
      points: 5,
      played: 5,
      won: 1,
      drawn: 2,
      lost: 2,
      against: 8,
      gd: -2),
  Team(
      position: 14,
      name: 'Villarreal',
      points: 4,
      played: 4,
      won: 0,
      drawn: 4,
      lost: 0,
      against: 2,
      gd: 0),
  Team(
      position: 15,
      name: 'Levante',
      points: 4,
      played: 5,
      won: 0,
      drawn: 4,
      lost: 1,
      against: 7,
      gd: -1),
  Team(
      position: 16,
      name: 'Espanyol',
      points: 2,
      played: 4,
      won: 0,
      drawn: 2,
      lost: 2,
      against: 3,
      gd: -2),
  Team(
      position: 17,
      name: 'Granada',
      points: 2,
      played: 4,
      won: 0,
      drawn: 2,
      lost: 2,
      against: 7,
      gd: -5),
  Team(
      position: 18,
      name: 'Celta',
      points: 1,
      played: 5,
      won: 0,
      drawn: 1,
      lost: 4,
      against: 10,
      gd: -6),
  Team(
      position: 19,
      name: 'Getafe',
      points: 0,
      played: 5,
      won: 0,
      drawn: 0,
      lost: 5,
      against: 8,
      gd: -7),
  Team(
      position: 20,
      name: 'Alaves',
      points: 0,
      played: 4,
      won: 0,
      drawn: 0,
      lost: 4,
      against: 10,
      gd: -9),
];
