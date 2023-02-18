import 'package:flutter/material.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';

// ignore: must_be_immutable
class IconWidget extends StatelessWidget {
  IconData icon;
  double size;
  Color iconColor;
  IconWidget(
      {super.key,
      required this.icon,
      this.size = 25,
      this.iconColor = ColorManager.white});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: iconColor,
    );
  }
}
