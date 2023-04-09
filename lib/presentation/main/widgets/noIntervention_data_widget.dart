import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';

import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/icon_widget.dart';
import '../../widgets_manager/medium_text_widget.dart';

class NoInterventionDataWidget extends StatelessWidget {
  const NoInterventionDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.hs100),
        CircleAvatar(
          backgroundColor: ColorManager.grey,
          radius: AppSize.hs25 * 4.5,
          backgroundImage: const AssetImage(AssetsManager.buildingWhite),
        ),
        SizedBox(height: AppSize.hs16),
        MediumTextWidget(
          text: "Aucun Intervention",
          size: FontSize.fs24,
          color: ColorManager.grey,
        )
      ],
    );
  }
}
