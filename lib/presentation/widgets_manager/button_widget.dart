import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import 'medium_text_widget.dart';

class ButtonWidget extends StatelessWidget {
  String text;
  // Color textColor;
  // Color BackgroundColor;
  bool hdn;
  double textSize;
  ButtonWidget(
      {super.key, required this.text, required this.hdn, this.textSize = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: AppPadding.hp16),
      decoration: BoxDecoration(
        color: hdn == true ? ColorManager.darkGrey : ColorManager.mainColor,
        borderRadius: BorderRadius.circular(AppSize.hs10),
      ),
      child: Center(
          child: MediumTextWidget(
        text: text,
        color: ColorManager.white,
        size: textSize,
      )),
    );
  }
}
