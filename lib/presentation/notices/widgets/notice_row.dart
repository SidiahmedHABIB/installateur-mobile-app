import 'package:flutter/cupertino.dart';
import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/big_text_widget.dart';
import '../../widgets_manager/icon_widget.dart';

class NoticeRow extends StatelessWidget {
  const NoticeRow({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          BigTextWidget(
            text: "Notice 1",
            color: ColorManager.mainColor,
            size: FontSize.fs20,
          ),
          IconWidget(
            icon: CupertinoIcons.cloud_upload_fill,
            iconColor: ColorManager.mainColor,
            size: AppSize.hs18 * 2,
          )
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
