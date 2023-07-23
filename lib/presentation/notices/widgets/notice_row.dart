import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/big_text_widget.dart';
import '../../widgets_manager/icon_widget.dart';

// ignore: must_be_immutable
class NoticeRow extends StatelessWidget {
  String name;
  final VoidCallback downLoadNotice;
  NoticeRow({
    super.key,
    required this.name,
    required this.downLoadNotice,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          BigTextWidget(
            text: name,
            color: ColorManager.mainColor,
            size: FontSize.fs20,
          ),
          GestureDetector(
              onTap: downLoadNotice,
              child: IconWidget(
                icon: CupertinoIcons.cloud_upload_fill,
                iconColor: ColorManager.mainColor,
                size: AppSize.hs18 * 2,
              ))
        ]),
        SizedBox(height: AppSize.hs10),
        Container(
          color: ColorManager.grey,
          height: AppSize.hs5 / 3,
          width: double.maxFinite,
        ),
        SizedBox(height: AppSize.hs10),
      ],
    );
  }
}
