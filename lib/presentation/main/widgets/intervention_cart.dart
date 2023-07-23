import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/presentation/profile/profile_view_model.dart';
import 'package:installateur/presentation/resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets_manager/icon_widget.dart';
import '../../widgets_manager/medium_text_widget.dart';

// ignore: must_be_immutable
class InterventionCart extends StatelessWidget {
  String companyName;
  String location;
  String phone;
  String image;

  InterventionCart({
    super.key,
    required this.companyName,
    required this.location,
    required this.phone,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    // big container
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppMargin.wm20, vertical: AppMargin.hm10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.hs10),
          boxShadow: [
            BoxShadow(
              color: ColorManager.whiteGrey,
              blurRadius: AppSize.hs10,
              offset: const Offset(0, 0),
            ),
          ]),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: AppSize.hs100 * 1.1,
              padding: EdgeInsets.only(
                left: AppPadding.wp10,
                top: AppPadding.hp14,
                bottom: AppPadding.hp14,
                right: AppPadding.wp20,
              ),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.hs10),
                  bottomLeft: Radius.circular(AppSize.hs10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // parte 1
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorManager.mainColor,
                        radius: AppSize.hs25,
                        backgroundImage: image != ""
                            ? Image.network(AppConstants.BASE_URL +
                                    AppConstants.DOWNLOAD_IMG_URL +
                                    image)
                                .image
                            : const AssetImage(AssetsManager.buildingWhite),
                      ),
                      SizedBox(width: AppSize.ws14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name
                          MediumTextWidget(
                            text: companyName,
                            color: ColorManager.mainColor,
                            fontWeight: FontWeightManager.semiBold,
                          ),
                          SizedBox(height: AppSize.hs8),
                          //location
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              IconWidget(
                                icon: Icons.location_pin,
                                iconColor: ColorManager.grey,
                                size: AppSize.hs20,
                              ),
                              SizedBox(
                                width: AppSize.ws10,
                              ),
                              MediumTextWidget(
                                text: location,
                                color: ColorManager.grey,
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.hs8),
                          //phone
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              IconWidget(
                                icon: Icons.phone,
                                iconColor: ColorManager.grey,
                                size: AppSize.hs20,
                              ),
                              SizedBox(
                                width: AppSize.ws10,
                              ),
                              MediumTextWidget(
                                text: phone,
                                color: ColorManager.grey,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // main color parte
          Container(
            height: AppSize.hs100 * 1.1,
            decoration: BoxDecoration(
              color: ColorManager.mainColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppSize.hs10),
                bottomRight: Radius.circular(AppSize.hs10),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: AppPadding.wp5 / 5),
            child: IconWidget(
              icon: CupertinoIcons.forward,
              iconColor: ColorManager.white,
            ),
          )
        ],
      ),
    );
  }
}
