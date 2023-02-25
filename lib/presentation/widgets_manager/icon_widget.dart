import 'package:flutter/material.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';

// ignore: must_be_immutable
class IconWidget extends StatelessWidget {
  IconData icon;
  double size;
  Color iconColor;
  Color bColor;
  double hp;
  double wp;
  double br;
  IconWidget(
      {super.key,
      required this.icon,
      this.size = 25,
      this.hp = 0,
      this.wp = 0,
      this.br = 0,
      this.bColor = const Color.fromARGB(0, 255, 255, 255),
      this.iconColor = ColorManager.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: wp, vertical: hp),
      decoration: BoxDecoration(
        color: bColor,
        borderRadius: BorderRadius.circular(br),
      ),
      child: Icon(
        icon,
        size: size,
        color: iconColor,
      ),
    );
  }
}
