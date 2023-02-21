import 'package:flutter/material.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';

import 'big_text_widget.dart';
import 'medium_text_widget.dart';

class TextCart extends StatelessWidget {
  double hpadding;
  double vpadding;
  double bReduis;
  String text;
  double textSize;
  Color backgroudColor;
  Color textColor;
  bool onClick;

  TextCart(
      {super.key,
      required this.text,
      required this.onClick,
      this.hpadding = 20,
      this.vpadding = 8,
      this.bReduis = 5,
      this.textSize = 16,
      this.textColor = ColorManager.grey,
      this.backgroudColor = const Color.fromARGB(0, 255, 255, 255)});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.minPositive,
      margin: EdgeInsets.only(left: AppMargin.wm20),
      padding: EdgeInsets.symmetric(
        horizontal: hpadding,
        vertical: vpadding,
      ),
      decoration: BoxDecoration(
        color: onClick == false ? backgroudColor : ColorManager.mainColor,
        borderRadius: BorderRadius.circular(bReduis),
      ),
      child: BigTextWidget(
        text: text,
        size: textSize,
        color: onClick == false ? textColor : ColorManager.white,
      ),
    );
  }
}
