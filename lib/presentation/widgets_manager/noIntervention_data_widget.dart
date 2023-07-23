// ignore: file_names
import 'package:flutter/material.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import 'medium_text_widget.dart';

// ignore: must_be_immutable
class NoInterventionDataWidget extends StatelessWidget {
  String message;
  NoInterventionDataWidget({super.key, required this.message});

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
          text: message,
          size: FontSize.fs24,
          color: ColorManager.grey,
        )
      ],
    );
  }
}
