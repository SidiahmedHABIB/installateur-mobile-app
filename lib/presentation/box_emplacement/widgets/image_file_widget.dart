import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/icon_widget.dart';

class ImageFileWidget extends StatelessWidget {
  File? fileUrl;
  VoidCallback clear;
  ImageFileWidget({super.key, required this.fileUrl, required this.clear});

  @override
  Widget build(BuildContext context) {
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
                  image: FileImage(fileUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // clear Method
          GestureDetector(
            onTap: clear,
            child: Container(
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
            ),
          ),
        ],
      ),
    );
  }
}
