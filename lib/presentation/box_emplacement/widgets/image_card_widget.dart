import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/icon_widget.dart';

class ImageCartWidget extends StatelessWidget {
  const ImageCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: AppPadding.wp8),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: EdgeInsets.all(AppPadding.hp5),
            child: Container(
              width: AppSize.ws100,
              height: AppSize.hs100,
              decoration: BoxDecoration(
                color: ColorManager.mainColor,
                borderRadius: BorderRadius.circular(AppSize.hs10),
                image: const DecorationImage(
                  image: AssetImage(
                    AssetsManager.imgInstallation,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: AppSize.ws25,
            height: AppSize.ws25,
            decoration: BoxDecoration(
              color: Colors.red.shade800,
              borderRadius: BorderRadius.circular(AppSize.ws25 / 2),
            ),
            child: IconWidget(
              icon: CupertinoIcons.clear,
              size: AppSize.hs18,
            ),
          )
        ],
      ),
    );
  }
}
