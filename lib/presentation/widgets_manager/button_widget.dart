import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import 'medium_text_widget.dart';

class ButtonWidget extends StatelessWidget {
  String text;
  bool hdn;
  double textSize;
  final VoidCallback onClicked;

  ButtonWidget({
    super.key,
    required this.text,
    required this.hdn,
    this.textSize = 20,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
          primary: hdn == true ? ColorManager.darkGrey : ColorManager.mainColor,
          onPrimary:
              hdn == true ? ColorManager.darkGrey : ColorManager.mainColor),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: AppPadding.hp16),
        child: Center(
            child: MediumTextWidget(
          text: text,
          color: ColorManager.white,
          size: textSize,
        )),
      ),
    );
  }
}
