import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/icon_widget.dart';

class ImageNetworkWidget extends StatelessWidget {
  String? imageUrl;
  ImageNetworkWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    print("imageUrl: $imageUrl");
    return Container(
      padding: EdgeInsets.only(left: AppPadding.wp8),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          // image
          Container(
            padding: EdgeInsets.all(AppPadding.hp5),
            child: Container(
              width: AppSize.ws100,
              height: AppSize.hs100,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppSize.hs10),
                image: DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
