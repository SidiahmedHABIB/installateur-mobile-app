import 'dart:ui';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';
import 'package:installateur/presentation/widgets_manager/small_text_widget.dart';

import 'big_text_widget.dart';

void showSnackBarWidget(String message, Color colorbg,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: BigTextWidget(
      text: title,
      color: ColorManager.white,
      size: FontSize.fs20,
    ),
    messageText: SmallTextWidget(
      text: message,
      color: ColorManager.white,
      size: FontSize.fs16,
    ),
    backgroundColor: colorbg,
    colorText: ColorManager.white,
    snackPosition: SnackPosition.TOP,
  );
}
