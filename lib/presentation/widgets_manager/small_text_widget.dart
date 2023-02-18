import 'package:flutter/material.dart';
import 'package:installateur/presentation/resources/fonst_manager.dart';

import '../resources/colors_manager.dart';

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
      style: TextStyle(
          fontSize: size,
          color: color,
          fontFamily: FontConstants.fontFamily,
          height: height,
          fontWeight: FontWeightManager.regular),
    );
  }
}
