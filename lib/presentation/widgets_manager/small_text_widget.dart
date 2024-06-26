import 'package:flutter/material.dart';
import 'package:installateur/presentation/resources/fonts_manager.dart';

import '../resources/colors_manager.dart';

// ignore: must_be_immutable
class SmallTextWidget extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  FontWeight fontWeight;
  SmallTextWidget(
      {Key? key,
      this.color = ColorManager.grey,
      required this.text,
      this.size = 14,
      this.height = 1.5,
      this.fontWeight = FontWeightManager.light})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontFamily: FontConstants.fontFamily,
          height: height,
          fontWeight: FontWeightManager.regular),
    );
  }
}
