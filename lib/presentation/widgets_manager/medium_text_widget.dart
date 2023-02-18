import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../resources/fonst_manager.dart';

class MediumTextWidget extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  FontWeight fontWeight;
  MediumTextWidget({
    Key? key,
    this.color = ColorManager.darkGrey,
    required this.text,
    this.size = 16,
    this.fontWeight = FontWeightManager.medium,
    this.overFlow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontFamily: FontConstants.fontFamily,
          fontWeight: fontWeight),
    );
  }
}
