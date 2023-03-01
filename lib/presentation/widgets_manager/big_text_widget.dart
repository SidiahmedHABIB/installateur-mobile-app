import 'package:flutter/material.dart';
import '../resources/colors_manager.dart';
import '../resources/fonts_manager.dart';

class BigTextWidget extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  FontWeight fontWeight;
  BigTextWidget({
    Key? key,
    this.color = ColorManager.darkGrey,
    required this.text,
    this.size = 18,
    this.fontWeight = FontWeightManager.bold,
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
