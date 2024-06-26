import 'package:flutter/material.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';
import 'package:installateur/presentation/resources/fonts_manager.dart';
import 'package:installateur/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  Color colorIcon;
  Color colorhint;
  bool enabled;
  bool isPassword;
  void Function(String)? onchange;

  TextFieldWidget({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.colorIcon = ColorManager.grey,
    this.colorhint = ColorManager.darkGrey,
    this.enabled = true,
    this.isPassword = false,
    this.onchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.hs14),
        boxShadow: [
          BoxShadow(
            color: ColorManager.grey,
            blurRadius: AppSize.hs5,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.hs14),
            color: ColorManager.white,
          ),
          child: TextField(
            obscureText: isPassword,
            enabled: enabled,
            controller: textController,
            onChanged: onchange,
            decoration: InputDecoration(
              // hinttext
              hintText: hintText,
              hintStyle: TextStyle(
                  color: colorhint,
                  fontFamily: FontConstants.fontFamily,
                  fontSize: FontSize.fs18,
                  fontWeight: FontWeightManager.medium),
              // prefixIcon
              prefixIcon: Icon(
                icon,
                color: colorIcon,
              ),
              // focusedBorder
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.hs14),
                borderSide: BorderSide(
                  width: AppSize.hs5 / 2,
                  color: ColorManager.whiteGrey,
                ),
              ),
              // enabledBoreder
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.hs14),
                borderSide: BorderSide(
                  width: AppSize.hs5 / 2,
                  color: ColorManager.whiteGrey,
                ),
              ),
            ),
          )),
    );
  }
}
