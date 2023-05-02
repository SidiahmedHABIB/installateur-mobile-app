// ignore: file_names
import 'package:flutter/material.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import 'medium_text_widget.dart';

class NoInterventionDataWidget extends StatelessWidget {
  const NoInterventionDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
